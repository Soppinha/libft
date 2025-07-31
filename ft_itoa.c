/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/31 09:40:54 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/31 10:23:02 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	intlen(int n)
{
	int	count;

	count = 0;
	if (n == 0)
		return (1);
	while (n != 0)
	{
		n /= 10;
		count++;
	}
	return (count);
}

char	*ft_itoa(int n)
{
	int				i;
	int				len;
	char			*str_result;
	unsigned int	num;

	len = intlen(n + 1);
	*str_result = ft_calloc(sizeof(char), len + 1);
	if (!str_result)
		return (NULL);
	str_result[len] = '\0';
	if (n < 0)
		num = -n;
	else
		num = n;
	while (len--)
	{
		str_result[len] = (num % 10) + '0';
		num /= 10;
		if (num == 0 && n < 0 && len == 1)
		{
			str_result[0] = '-';
			break ;
		}
	}
	return (str_result);
}

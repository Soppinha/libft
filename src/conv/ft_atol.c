/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atol.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sopinha <sopinha@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/01/29 16:13:19 by sopinha           #+#    #+#             */
/*   Updated: 2026/01/29 16:14:19 by sopinha          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

long	ft_atol(const char *str)
{
	long	result;
	int		sign;
	int		i;
	int		digit;

	result = 0;
	sign = 1;
	i = 0;
	while (str[i] == ' ' || (str[i] >= 9 && str[i] <= 13))
		i++;
	if (str[i] == '-')
		sign = -1;
	if (str[i] == '-' || str[i] == '+')
		i++;
	while (ft_isdigit(str[i]))
	{
		digit = str[i++] - '0';
		if (sign == 1 && result > (LONG_MAX - digit) / 10)
			return (LONG_MAX);
		if (sign == -1 && result < (LONG_MIN + digit) / 10)
			return (LONG_MIN);
		result = result * 10 + digit * sign;
	}
	return (result);
}

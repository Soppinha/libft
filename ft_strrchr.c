/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/22 10:07:12 by svaladar          #+#    #+#             */
/*   Updated: 2025/08/06 16:24:21 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{	
	int		i;
	char	charc;
	char	*res;

	if (!s)
		return (NULL);
	i = 0;
	charc = (char) c;
	res = NULL;
	while (s[i])
	{
		if (s[i] == charc)
			res = (char *)&s[i];
		i++;
	}
	if (s[i] == charc)
		res = (char *)&s[i];
	return (res);
}

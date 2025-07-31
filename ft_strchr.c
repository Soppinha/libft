/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/19 16:11:30 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/31 09:31:40 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strchr(const char *s, int c)
{
	int		i;
	char	chr;

	i = 0;
	chr = (char) c;
	while (s[i])
	{
		if (s[i] == chr)
			return ((char *) &s[i]);
		i++;
	}
	if (s[i] == chr)
		return ((char *) &s[i]);
	return (NULL);
}

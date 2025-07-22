/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/19 16:11:30 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/22 10:03:13 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

char	*ft_strchr(const char *s, int c)
{
	int		i;
	char	charc;

	i = 0;
	charc = (char) c;
	while (*s)
	{
		if (s[i] == charc)
			return ((char *) &s[i]);
		i++;
	}
	if (s[i] == charc)
		return ((char *) &s[i]);
	return (NULL);
}

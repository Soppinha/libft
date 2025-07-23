/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/22 14:21:07 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/23 13:42:09 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

// preciso testar

char	*ft_strnstr(const char *haystack, const char *needle, size_t len)
{
	size_t	i;
	size_t	j;

	i = 0;
	if (needle[0] == '\0')
		return ((char *) haystack);
	while (i < len && haystack[i])
	{
		j = 0;
		while (haystack[i + j] && i + j < len && haystack[i + j] == needle[j])
		{
			j++;
			if (needle[0] == '\0')
				return ((char *) haystack + i);
		}
		i++;
	}
	return (NULL);
}

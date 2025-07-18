/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/17 11:12:39 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/17 11:40:49 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	char	*tmp_dst;
	char	*tmp_src;
	size_t	count;

	if (!src && !dst)
		return ((void *) 0);
	tmp_dst == (char *) dst;
	tmp_src == (char *) src;
	count = 0;
	if (tmp_dst > tmp_src)
	{
		while (len-- > 0)
			tmp_dst = tmp_src;
	}
	else
	{
		while (i++ < len)
			tmp_dst[i] = tmp_src[i];
	}
	return (dst);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lst_to_array.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/11/10 18:00:00 by svaladar          #+#    #+#             */
/*   Updated: 2026/11/10 18:00:00 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	**ft_lst_to_array(t_list *lst)
{
	void	**arr;
	t_list	*next;
	size_t	i;

	arr = ft_calloc(ft_lstsize(lst) + 1, sizeof(void *));
	if (!arr)
		return (NULL);
	i = 0;
	while (lst)
	{
		next = lst->next;
		arr[i++] = lst->content;
		free(lst);
		lst = next;
	}
	return (arr);
}

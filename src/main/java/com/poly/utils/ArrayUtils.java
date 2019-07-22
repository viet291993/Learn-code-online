package com.poly.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ArrayUtils {

	public static boolean isEmpty(Object[] arrs) {
		return arrs == null || arrs.length == 0;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Object[] removeItem(Object[] arrs, int index) {
		List list = new ArrayList(Arrays.asList(arrs));
		list.remove(arrs[index]);
		return list.toArray();
	}

	public static Object find(Object[] arrs, Object obj) {
		if (obj == null || arrs == null) {
			return null;
		}
		return Arrays.asList(arrs).contains(obj);
	}
}

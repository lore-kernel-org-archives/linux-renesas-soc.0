Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987F3F8704
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981225; cv=pass; b=flbQglzGvRERBINVi0I94SSSEFR1Gy4O9km8ntIj/RlgrwsE9rMhbHHQ7ooB0OJahsvHbOrq0lhD8wstEeQMA3Xn2NkeyZvemEXe9R7VsxtXvaBUzZXLVQQiSbzFHdnveI1/K6GULDAD2b+xgsSXK9b5VxP35K7C9t07uDa70Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981225; c=relaxed/simple;
	bh=6S9TkIeh9d7MOG/y/RYKoCP7qm0FvkE2uz6UMNW6Wl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDAEInmqIoYYvo1w/BAZ377IYbzSKfVzLloZ6eYRZxnOOtQG/vGH4LLLGGInsapFVDoRj5Emhm8AVsmje2bDEd7SLq/BZ6TjdfBkyJ/e8xnwak3oOsDwHqIVfTPyOE5psPG6xFphiBrmEmELPXARRWnlxSgq9H5CZDMYK1FD6Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KIwHsSqc; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KIwHsSqc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bab82d75fdso65946195ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 08:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779981159; cv=none;
        d=google.com; s=arc-20240605;
        b=XpXnCHH/D2Y7UjDCXhiYki2ZKkyqd1WEoDir38y2NiOV+Bgj7+357hKlxlPQHAdUBT
         BGMxQsy8mwRHSt8wg1iTsreEH4IOEccrDgVTFkvxfV0QDR9Wb3cXNGHampTLyk2drRiD
         aSgu3XzOJE6SkovCHRVFlb2fc5vJbppevvvlv1EN3m0oUWesr5YZkP5j9hofcfjiJqPA
         k6rdWUSYnopy6ec8skTReQ/NkjNsDVsoocqnOwICwwJ5Gopr900wSvv0EAC9v8AFmOac
         Zfkd4MM4dmhiN9L5PAK+XIcvozyV0hXItmxLIA0OPw9tqxZotpREE+xrfkVQRaDtaCm1
         t2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNBevCqfk00J2rt3EB2DabDjtH6s2ImxOWmElvURxdM=;
        fh=yKyjZOJCcoNVJDsWinVzLZJCaF3OgbsdgxO0gJ67JOo=;
        b=AZ7p3ojFVQ50PY7PZw8G7epNUdr7FAk2xIiSyfetY/oG+0X2sgQY6OwjxL30UYXAYp
         9eQESe+n18N9Nehg4aCdYj31+SDq5ZrCZQ6GOJweiQVee9lUqSJ3M55r2zVJrbMsvHfq
         LvCHQ+3y4110VPgN3+tp3Q+bFAtkFFmWnO4aP/bqXtAXwuAp991mGRSJj0V15ywPRM/y
         BXCRp4ZQWylAKzLruvZfI6HSRWpmQTUI5br7h+mdRw74L62ryX59uKAwtGJLMtSlsICx
         deGUYJ8dquhs6fvhtWQlMUF7IRV00f1gwaD1XW0JFvXnIfDzKzEPLt0kXLEqDCF/hdA7
         YbSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779981159; x=1780585959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNBevCqfk00J2rt3EB2DabDjtH6s2ImxOWmElvURxdM=;
        b=KIwHsSqcyql7qcD8GdiJhMZrTA14unruMIFF4bBLBxgMdaZbUjZaJGr4jRflcu7p5L
         YBZni2zygAK2aCyg6ncGTn4hlctMp80G8V6MSVBEZyMo7KoA1uzKcJIaFzYt53UspJsV
         hv4405yx2Qz/CxBIaduReWvvCxFwierAUzB+1uG2yd3NJQTBsRVznwSWny0Dmyn56SS+
         JJ4rtVFF8QVRzB4qbxvxdEkdRbGYxDOFDjKWpIQTugDoOK5uSaAeX8Hz09h878We09mv
         hWQ4ekGwKMyRag7G6IyHEV7q1maCTGz8Kuf7yQJDyDSyOEU/qYVLtRSBM9UY4uYIlQ2c
         MEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981159; x=1780585959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNBevCqfk00J2rt3EB2DabDjtH6s2ImxOWmElvURxdM=;
        b=d3nxOAbNmf6+D0oYN/KdlCcbCyNwApazXWrejyfknRk2levLFIe3eF7gqz59pVo6E8
         CAZKOaqLOa4KNAMBJt5ihqWc9tRUiqxRK8Z6Cmw28QSasTVjJUzDtXUE3kijQsNnswSy
         1No7a/oxnADBbYlwTk3DwQ1h53FFSbMV/mPqldnHA9yvPfFWHulJKiM4fpHbWRT+EUEj
         ZtEd8a+PdNlQadmLvqdSnjTq+ByHFCzlxH43LLjOFnqv+RYY4aJ1V908XXReL/BMXsfs
         dd62mNOBmPCLLn9dAICiG5+vyeEh8L0xjt5CuMG8uORUOrD8SA4dRDcnlceKrYujyWm6
         9zYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cd5ZQRGe17Jmh7d+hMFL7kcg9UotEuaJLB15VCcbZzc8atKLW4KB7Py943ZkP6A7NyWinV6E+VsgyY4gzVG2tZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjQpXhF7CkWw+wkzhl0GiFK+T/b6lCike+rOTJqP57lm1n+NL
	uHwcYi5rSOY9uHW7pt/8SsbKIcVYMTy6i0JU/njmjgiBQPdapRkD3/CLZUVv3Sj6mb/Xl64IVnE
	1Qf75Hkcj/sS7w+A/wovLq8BrJIys6VHh6a/SfpwY
X-Gm-Gg: Acq92OHmCSEu7CqHujPqXi/DblPJZak/AdG9Lnin2PNAmfJIYyQr6Q/dQKGDpoayXKJ
	ohiIaa8e9WCxZxRsfBwC7Pa7uqc8NTHjU8tEOyfbPkQGPne1SsfOU8bc70NE+iFFUdrrw1LAdK6
	qEm8Gw7B1nz/XfMl6uHpoMnYer3eW3MflcXQJzl3TYbY8+1pP6dFpPLNWRnCjR1EO11Z0IxSbe1
	VsEkDl+j3GxwJeb8ubmuN9NXnlabIklNzUByjgnlZC7N8gOM8+eyDAovsS53lsbVGTJeqz0MehJ
	WprbkLTfr1ZfCK5ilg==
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id
 d9443c01a7336-2beb06ea859mr302897195ad.4.1779981158837; Thu, 28 May 2026
 08:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202605281316.GwqEa9Tn-lkp@intel.com>
In-Reply-To: <202605281316.GwqEa9Tn-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 28 May 2026 11:12:26 -0400
X-Gm-Features: AVHnY4KGkw7s8GFEZnhSp-WLxdURT-RSXphDvHJcUZTiyxeBb39-HOM0H2amaTc
Message-ID: <CAHC9VhQkE9cNxakvHSn8wgguDTehYHUpF7ujc+tzUbT1fqgmzQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION e7d700e14934e68f86338c5610cf2ae76798b663
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, audit@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
> branch HEAD: e7d700e14934e68f86338c5610cf2ae76798b663  Add linux-next spe=
cific files for 20260527
>
> Error/Warning (recently discovered and may have been fixed):
>
>     https://lore.kernel.org/oe-kbuild-all/202605280441.YSawqHBc-lkp@intel=
.com
>     https://lore.kernel.org/oe-kbuild-all/202605280456.3Hhpgxl0-lkp@intel=
.com
>
>     kernel/auditfilter.c:592:15: error: incompatible pointer types assign=
ing to 'struct audit_fsnotify_mark *' from 'int (struct task_struct *)' [-W=
incompatible-pointer-types]
>     kernel/auditfilter.c:592:17: error: use of undeclared identifier 'aud=
it_alloc_mark'; did you mean 'audit_alloc'?
>     kernel/auditfilter.c:592:38: error: 'audit_alloc_mark' undeclared (fi=
rst use in this function); did you mean 'audit_alloc'?
>     kernel/auditfilter.c:592:60: error: too many arguments provided to fu=
nction-like macro invocation
>     kernel/auditfilter.c:592:85: error: macro 'audit_alloc_mark' passed 4=
 arguments, but takes just 3
>     kernel/auditfilter.c:879:10: error: use of undeclared identifier 'aud=
it_dupe_exe'; did you mean 'audit_dupe_rule'?
>     kernel/auditfilter.c:879:31: error: 'audit_dupe_exe' undeclared (firs=
t use in this function); did you mean 'audit_dupe_rule'?
>     kernel/auditfilter.c:879:59: error: macro 'audit_dupe_exe' passed 3 a=
rguments, but takes just 2
>     kernel/auditfilter.c:879:8: error: incompatible pointer to integer co=
nversion assigning to 'int' from 'struct audit_entry *(struct audit_krule *=
, struct audit_watch_ctx *)' [-Wint-conversion]

Thanks.  This should already be fixed in the audit tree, if you
continue to see errors please let me know.

--=20
paul-moore.com

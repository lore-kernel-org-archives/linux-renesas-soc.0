Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A53DD86C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567896; cv=none; b=YE/QRd3DS8B1+QzA1Xe59zh4l0Xa9RvMEZmp+Qno6witPeCJIP950z95G8DyrJQO3I3yPVXV1IBT4Gb9wwpUXLJlP90Pkz6GQofgRkNzn7TWgF7mY0BhXSua9ym7JBKsqnrNyAT5P+2cbcRnG86txe7u83b7QyTSpPuKeqLfJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567896; c=relaxed/simple;
	bh=w/eXQPGbd03iM9t96bJfR+o+/5L1N7pSYa1fCCqF8nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrK10OUUF+IupEs54eGyOTk9W7uxTY0Wep0+aNVklKfZbmagBH+1QBkOicgZ2P82lWumSTAzQHj5hRU6aE/NPEzl+XJ9pMCmv/vumNW3+IoB6EiGMcFcvZdJ01W32VFvR4qdwrDqVUtzW59026MKIigPHItWEfc/wgJnYHDHomE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso319696e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567893; x=1790172693;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8tYTO2oWmvq4rR3J0AZylxe0N8AEtq4E2BxgNYjJbc=;
        b=uN9juC2ikY2aVSTwH/3+Tjwdz1V0+36rjtJJ5s8jpnBJSn1m2vNO4cQL4DKbplZbBw
         fnC6y0H6kRSrxA33K02OJSya17I1uhDJKr091rD+lhEEy3njiNEj2DbV5IeStT0irrj5
         FEj/I8TIG/eCLyc2MNHpKuZKbVEAe3ViLGymtSvZYxvSvmz26Q+4KJg+Lyb+6pCHcVVH
         nDmdq/lAafn7chgsxWpZfz5hvCoaP6GEX9okYJiymH5CvBGaD7gbiwMV71SQN21MCKse
         mJ1fx5q3zXl3dr95871VLVkx8dEfIrRkKV27x0AfvqlS9x2KkUmaL0wtKQ772g1YT/E3
         rZXw==
X-Gm-Message-State: AFuF++me7N4tXBr+FGCNKljgiujbyj3IhqG9R7c02jvZF8DRLP6BcS0T
	G8sfklbJExaDVr4IFGNQCpn2N0gsNPGK+SsKtMxBu0gfBdDTeW2FJA09O8U3tO3H2P4=
X-Gm-Gg: AYBFou0fTWjc8mQuFp2ncrbHVw3OU5614c1iw4iwKmX6DdA50yszbtP2IPxuEM86jNw
	2Ee56aTgxz52stYKUigIu//9dQjdtfN51IUhCNet6nJ5nNySFnd9oE7TjglXy55R/0KDyO+H4RE
	i3hVSQl4s3qqkjZAYq58qnXSLAglfVtCsFgkibYWiflQg+GJe6ufov+bzhqRSz2sphE9r7T4GZ4
	boidxqmJmTMrZK/+KESlH/vgIkA4xqT+s8ynSViqW3oRgwtEFzrgtc8iOFeKHsVxCn44TNgzs7Y
	V4Rn4xi+gPNkWXVQrgk2fjaaKVRB5yvXVShuiUVb4L9PUQGjfDA8kaiM9NL+jPY8ogcUm+PwpWY
	mwvQsF3uzdLvT8DcrH9XLgQaMtzCyCW609iPYLBIJZbGIdsV6L6RjE5Poi6dsWzV6sExcYy0HJ6
	WRSMd4sZDVqnzsC4fQtboY/i8L17iRCiz3vtKLnjHw+oU9b36FYpYmNJ1JbklRBb4nRAwh9Swvw
	Mx77zyMeftRtGOgN9g0/t+mLUhHSAMTcli9
X-Received: by 2002:a05:6122:f8b:b0:5c6:58df:5826 with SMTP id 71dfb90a1353d-5c99ac9815amr3463471e0c.5.1789567893055;
        Wed, 16 Sep 2026 07:11:33 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998735490sm2846900e0c.0.2026.09.16.07.11.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso319670e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
X-Received: by 2002:a05:6122:2986:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-5c99ab5599emr3306736e0c.1.1789567890852; Wed, 16 Sep 2026
 07:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
X-Gm-Features: AcwNN1WJafhDFv8HErK5k3kvDPcaoO0zG6c_BSadTCdG1pMVoaBKHlljZ751d3o
Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

On Sat, 12 Sept 2026 at 21:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> While developing the hwspinlock core or a device driver, it can be
> really helpful to change states from userspace. Add a debugsfs interface

debugfs

> to request, free, lock, unlock, and test hwspinlocks. Because this is a
> potentially dangerous interface, it can only be enabled via source code.

... code,

> Similar to writeable attributes for clocks where this idea stems from.

similar ...

> The created files take a single id for a single lock. To test all locks
> in a system, one could use this oneliner while in the debugfs directory:
>
> for l in $(cut -d: -f1 hwspinlock_summary); do echo $l > test_lock; done
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c

> +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> +{
> +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);

Perhaps just "test"?

> +}
> +#endif
> +
>  /*
>   * subsys_initcall() is used here but controllers may already have been
>   * registered earlier or will be later. The rationale is that debugfs is

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

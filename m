Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18837BE6B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631085; cv=none; b=XkWJ9FBstFM+bnXBMwOQYbkzr3YAuA8ntj8lHTdt1t55DzEi9OJWElLCNBpKa2p4SKa0ohHG1JS2sNUYh6T8U+c8cGhhLt/Fr/ld3/g97DTYYfA/HZRUqaTVjM4+GEVjAE0Q37U/A9L9bk+6VbpsZblgFAlCtqS32AgUjjSjWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631085; c=relaxed/simple;
	bh=8Hw80TAgKPDNBf0vWklNUbq3jAIqiU6weeac3Z8w6a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLoTENgSG8hbOIGRzn2x6gG6YTJ3GzwHMhi/WCVZmJRg1R9cBkJ9OdC5NFECYHw1xmf+n4huP9Dsb2EZzP+86b7fjkXzyEBm7OadMAI6hmO3fCoWgPnYzXXOYh0pUmKwb6pin1PQwYB9RjFsRWPy9GxWx5j44FohEIeeg3jyLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so194027137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631082; x=1790235882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TZYjUR6uq0wvJ7yfCunhZRC4s2XoZDscTLrj+tpsIdY=;
        b=NTWz6PsohaO1dODFy4fB5p8llzLrfqdYl0yt+WWoMLlO1KHS/WYtvFarqCc1y6vI3Z
         shAKbX+z9r5L9mnLhjX9vJcEa4287p9iNEoKsJKK+wsYyFGk7tSq/YVYTsneM3GLmfgl
         iJjQXe/rgOiEjtIeH3mZZl6It9kypJsUJmWhpM/+vrN4po+asmLthQbfiU9HkiRARZZP
         A7HELR8tlpGwALg2IjamLyyofexdls/6iWpj9zXK5JXEqNkz98DHchG+tL6paQUYCO8O
         vWaOGOyIF3jeXt9iSkKePHmQKT5mF6hqNfYdLxEt2fmcMNTKNQw9xrVaJCbWYgJua/oC
         nGDw==
X-Gm-Message-State: AFuF++lKZKbg8btglMLfS998rIxadtfSR4IQqAcboy4YloF5q7tGx5yk
	SYcAhwTgfDO+M5sPCByZI2n3HhkcFkLhnCUsyGB0aRXFHD5as4HDgEcIu4bAVuIaZ3k=
X-Gm-Gg: AYBFou1ot/RnarmY9e1MK+s6rNPnyp0kdEsCtuJPunJ7mt782XsTSEQ52VwL9NVGjT0
	ItSjsLdueAF2nBJzqAgSDFxqyw2JtFWgDurFB4GFuEO8bttiaAAVnctgzO25E6OJGYpQHl69TsN
	/IspKlAFBbwY11rJZKK1qOFRIbyBEYjeT/le8dMinCq0f1edW4e8JdzGE3Pf2QpgjVQ46FXJeEA
	XmocWceaXsCo113ytk168ooeuQgFwS6ea/M4ZjtEr9Qt0hZZHB1uOQG8Go+vspK5HPW0Uqp6Wv7
	M1yfWkzVLbGO9+K6ylqQXdFoBvBiy9vuNjMtr1WPvqBAJa8eIFsx6JLYw0qD1VtGKPpAacw2M/z
	EBMsnUSgYqJC6NWPdB2TdPCM7pSDbsZjkdWXF4aRnPgPXYbmegiimhBp0YD1gOtg2O15poJQ722
	Pmp7AoBCa2WwX39y0Wi3Xj11jQwIH+zBIIGVlD43cXb/LHAGfDqrgsEYGjVI/ormYUC24ImI4rA
	uVDmcGJ6WExq7NiVzfF5fh9J3dSHBfaJ3U+xvw=
X-Received: by 2002:a05:6102:f8f:b0:79a:7895:c36a with SMTP id ada2fe7eead31-7a029f1425amr6342264137.13.1789631082242;
        Thu, 17 Sep 2026 00:44:42 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e334979asm2482998137.10.2026.09.17.00.44.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso128369241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 00:44:41 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0e:b0:79a:47f7:6cfb with SMTP id
 ada2fe7eead31-7a029f141f5mr6828795137.12.1789631081396; Thu, 17 Sep 2026
 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <aqsMzXQ__BsWXUqH@shikoro>
In-Reply-To: <aqsMzXQ__BsWXUqH@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
X-Gm-Features: AcwNN1WFTEVxpdlneYZzV24ejd-9Z4yFFiZKF6ULft6pvA_51GkjVjhhS6OMQds
Message-ID: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> > > +{
> > > +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */
> >
> > Do you mean xa_find_after() may loop forever?
>
> Ehrm, it's been a while, I need to look this up. Which means the comment
> is not explanationary enough :/

Yeah, I'd expect xa_find_after() to do exactly what you want...

> > > +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> > > +{
> > > +       struct hwspinlock *hwlock = v;
> > > +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> > > +
> > > +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",
> >
> > For easier parsing the output, you may want to use a string without
> > spaces, e.g. "busy", "active", ...
>
> I get the idea, but haven't found a nice word yet. "Busy" could be
> interpreted as "lock taken". I'll think some more about it.

"used", "bound", "unavailable", "occupied", "reserved", "in_use", "inuse", ...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1083ECBCC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182600; cv=none; b=MxMnwwNHQHLXWHRX+LGyeTpOMO1qJFFHzFDZQEVptA9goIR0IE/0UT6BRaOoK3dexoX3TTRZNT1XuhMakxU58KuApLueLsCs9xf+PxGx0l1J5t6zWzBypbZkBFcTpaP9UF/FKcmlYdOfskAd0Htstl1qy2CYsK3W8lGepIxP4DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182600; c=relaxed/simple;
	bh=veck/ShnflFjh9Syx6FHVGS4bSqWZD1BdGglAdnb+vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyOjLE3K82gFHqaUGMVBhvzeWz++nxKBkwMGHFOHEp1eUqiL1tj+7sbO7uqG0tSJLxudlBwyeMhgobtgHs3DVBEoaCme2v7P/TX7lLxYWK+d2MNIAVmdV5FO6EXcXtCVB5GN5PtPsgMJPyHe4R3q3+KtXEC7rAXmCBm6lDN5ofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso4464836e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 09:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182598; x=1776787398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZI8timdhYxIowqe8hHVI1GlZ/jC3901tOSWf3qRzek=;
        b=XdoufTPOXq7aSWECV4lr01PMXlIqdAwG505vV1CPNXnBYAHpxnO28WR8qIpS6PHKLW
         wVZtDaFoM4zhEUUECJzdgAFjetU1khaXkURrrV5lAvUoRjTj2RqRwyLQCUWnaNcSzWAS
         gv6voNU0CDXAGm6MXuz/YAMGMmAyF0I5VrmtdmkNfvyugYakLNY5mOaWxIozqyOa+edL
         83koy26EKvI8+p2Uxwv43q4a4wgZhkWMWsxDVWSFWTechDJ7jNzJhqV7+ChZjgyJUvRO
         m597Cl3i4DOCG1oJXRRXxZKM5c3nEhx/wsucbA4NV7URADGW0BRcJfSaFJpaYSYiSPyD
         Ukmw==
X-Gm-Message-State: AOJu0YzuV+JWqAtjSOX4Nimg41fjWbgArFud0MAQD1ZXgy0X4hZb3ktq
	UogpuIdCU+nM8/wYjybz+UV1FllAUHjoW9/gvqnA3bzAd4g3aJ/J7GNh1W5ArObt
X-Gm-Gg: AeBDieu/K09ZRlMjElaCQ7H8ps49TUA0uobFUCEKE7uq0CshQ85VP2u6wfZ7u8RYShT
	5cBnNd4zwELtJBgoCi1RsJMABiIw83/jhCsSDL5uHnVhVD2JLnHt99a2A9gsG+Fu67whL0H05q+
	mHDAXjD5gO+P85isr4XAI0b8flTDbHarP9jInmtdyxduvEqSoZq3Vnk/0q2LZUD4BhsnP9j8Wrn
	y6MtzZhCBaFWU72A3/4tGBU7KeT4y65iN/5MEoBmRzjSfgZ6bsD6pGUxzJXo4XTnOROX9r9zm80
	LXyxyFClwsv6IotjFtRZdaarP3nDLMotqbuoGZUivUxBlreQaBuIgtcTUrzBgjAXjMvqWqZo85e
	FalOcve/uhEKo6Q2GMaPxy7EQORgVQ/JlUVkhAdgFiyvn4Lw59BaNZNLVvb7z7jeF3Md3Zmy272
	Ne2DCJZuMjdOR3xYqZoXlUDigIZaNEzxhmKhYUMByf6rMNKxEygy1KIfOjg1RFJvy1CpJdmxpCZ
	8TvoR8trPw3mw==
X-Received: by 2002:a05:6122:e44c:b0:56b:7023:1393 with SMTP id 71dfb90a1353d-56f3bce3ad3mr8741994e0c.11.1776182598009;
        Tue, 14 Apr 2026 09:03:18 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954bed2c731sm8027390241.0.2026.04.14.09.03.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 09:03:17 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f75445470so774737e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 09:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:2a0b:b0:56f:22ad:f5c9 with SMTP id
 71dfb90a1353d-56f3bb29f7cmr8504548e0c.2.1776182595627; Tue, 14 Apr 2026
 09:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413120139.36287-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXr2cM0KZhvOqueMZ+wQ6FqEeoPGvdOLG4g+AzWirpcGg@mail.gmail.com> <ad5dLuPq15ic_69f@shikoro>
In-Reply-To: <ad5dLuPq15ic_69f@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 18:03:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqVDTEchUYvM-4fJEGn46VH361cgAtaUm7QCjbuGJDzA@mail.gmail.com>
X-Gm-Features: AQROBzB0n6kZlxtlR7zF_vuJ18QJyQ3es8yI27i6gWIs-bKtJe2IntzvAGtC2a4
Message-ID: <CAMuHMdWqVDTEchUYvM-4fJEGn46VH361cgAtaUm7QCjbuGJDzA@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: add list of used channels to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 14 Apr 2026 at 17:28, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Thanks for your patch, which looks useful!
>
> Glad you like it!
>
> > Can you please put it in a subdir, like all other summaries:
>
> Sadly not, because of the paragraph from above:
>
> > > Note that mailbox controllers currently can be instantiated at any
> > > initcall stage. So, per-controller debugfs handling was discarded
> > > because it is not clear when to create the root "mailbox"-debugfs entry.
> > > A central file was chosen, similar to the GPIO subsystem, which is
> > > independent of the initcall stage because it will be accessed only when
> > > userspace is available anyhow.
>
> I would need to use core_initcall for the mailbox-subsys. debugfs itself
> also uses core_initcall. Then, some drivers (e.g. hi3660-mailbox) use
> core_initcall. I don't think the subdir is worth all the potential race
> conditions and fragile solutions which usually come with it. Or do you
> know a solid solution to this problem?

I am not asking for a per-controller subdir, but a mailbox-specific
subdir. Surely you can do something like:

-       debugfs_create_file("mailbox_summary", 0444, NULL, NULL, &mbox_fops);
+       mbox_debugfs = debugfs_create_dir("mailbox", NULL);
+       debugfs_create_file("mailbox_summary", 0444, mbox_debugfs,
+                           NULL, &mbox_fops);

Cfr. https://elixir.bootlin.com/linux/v7.0/source/drivers/devfreq/devfreq.c#L2036

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

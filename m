Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6A23F12EC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632656; cv=none; b=KXIpHosjWeS6qkHQiGJyJeZqUPSVWRJOG4dVvKMnNcy13fp1XRNVoOSrbfrMZgMZA48SXs+XWDfGvvSoXNQ2TCqQNliiItYb3wcSmNFOKP3lNLy50fSE/SSwUfPHIFCUllSNcrFuS2taOQSbNromCb9niMiE1znjG7L+Crl2HJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632656; c=relaxed/simple;
	bh=m3YGZEy09yRgJ2JaKzPyUPdH8tTqM2R2o2g/OwqIHvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adcMof6PtVnGEulopwvVEMQf6YxErCtCrEYoSuxOsfTXjg/59RSTnv8rOPAgPPS3QfVQ+qdV+X5VijXhm7gmKn4pCw2liOvfZ+nqb6LwTxUyJfC3QvKUwvpldh44QytpDOHZBZhguh151saEGilCgDTImiqbhl0Ni1MUAkQ3mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78a338fe106so528484137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 01:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632653; x=1790237453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/n1V6C1SyVBCThBez7rg4ybTZbuRI23DZ9D8Q+s9AMA=;
        b=AwvUdg4la0C8KthgAuihvucAtqwSuvC//SMVp3/4KQz6ukQTLkD453nyfkpVoNvLRL
         /hFDF/Y4Hd6jNi9+xFue+Xyhow9pqIgGOWjG7Vwi+oNJXSF5soZtVaQXW0gOYiWLRE60
         P9veZyJepsPzMevpyc2guyablSVfHQxhYGOmKHwh1ZNK0i6H2RwrB7LAbMg2JoR8jHiI
         fD1vIxJTjmwkpAoj0hHEmVm1/E0vAOCyr8VbgYbMZA5VZTAbsq2Ky1rNZx2opXNdug28
         +0rYCP6gXZkYGYERkBdiXOj6J91OnOG47SbJlBIO58bKKoNZsLtVFCz2Uhrkbn5mkQYa
         F0aA==
X-Gm-Message-State: AFuF++lfKOlplo9CSFMbdxSD5jzqpjl/5NNUoPXfxONe+3c1fJDdDHVo
	aDURwiE1FcWZjcubxW7TK5DV9l3TiP9ochFfhKwjoVZ3p1bH208XXidPt4tspijZMgU=
X-Gm-Gg: AYBFou12Kk5lil30WmVrTFFHrULxOXMYiedoJ2mXdMGd7VPCspMkXX8QDLbjR1vlQ+/
	hD8CVwfusuViomdM8E9t8xXl5+6k0X2fxxgk1uyDUdpL9NV3eustGCVojk4WwaPHxLqO9rvAzB4
	eC/T+LUGk9xdSfdfbYp5YwsKO4UYzzEIOReman8f9wg9pdGK2rAt5ecn7bFI0PEPmePOuvoin+q
	a19NFKA7tKOnrt5gUzujoEMljh2JbNmLnVgzGg8myVQveasvHAMzSyFiawriq5/U8Yodh79xKWO
	2Kyi8xMgxxuVn+z9KLj/L9jG673uTEJuApjdRSmaewdVfX22xVfpcHErMtD4wCqJvF8hi2kiNFQ
	BaYuFyU0NwIFZcJA1xz7e9aIVSYdkvmgACtby8JxG9FnpFU/irMpHmabCeDbw+zs0p+zkAT1q2o
	AqywOy27Z4Qtp+qJIoYl1RM3WN4VP8GxtlQbTtKih2u/Vxvp5JpqPOJPdWfYoJfLVfdxojbmcmW
	y/rmT2/72+ylrhm6O7VUkyuLjmNg7wiXon6YA==
X-Received: by 2002:a05:6102:61d3:10b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7a1e8138ae6mr567797137.6.1789632653045;
        Thu, 17 Sep 2026 01:10:53 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e3a5938bsm2598100137.12.2026.09.17.01.10.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:10:52 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb1fb9508so477507137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 01:10:52 -0700 (PDT)
X-Received: by 2002:a05:6102:a18a:20b0:7a1:f2b5:645a with SMTP id
 ada2fe7eead31-7a1f2b564f2mr452263137.23.1789632652708; Thu, 17 Sep 2026
 01:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-4-wsa+renesas@sang-engineering.com> <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
 <aqsNpEXjuZswCC9w@shikoro>
In-Reply-To: <aqsNpEXjuZswCC9w@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:10:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
X-Gm-Features: AcwNN1Wcf_hW5MJVX-r-TSDH-HlDt_qd0MZzGiSdL1Dk0dN2d6j_lLw27_H_CyM
Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > to request, free, lock, unlock, and test hwspinlocks. Because this is a
> > > potentially dangerous interface, it can only be enabled via source code.
> >
> > ... code,
> >
> > > Similar to writeable attributes for clocks where this idea stems from.
> >
> > similar ...
>
> You mean I should merge the two sentences into one?

Yes, as the second "sentence" does not have a verb.

> > > +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> > > +{
> > > +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> > > +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> > > +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> > > +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> > > +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);
> >
> > Perhaps just "test"?
>
> Hmm, too generic for my taste. In fact, I think I should maybe rename it
> to "test_single_lock" to make it more precise...

"test_single"? All others don't have "lock" in their name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

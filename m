Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D833EEAC1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630825; cv=none; b=czuBodT5ZP5mBW6fvp5ElRm/+v0GERvR2e1gh7GmiXEwCqtaK5n2jifdA6+2urym84BcGJWj7DAKdob8BiU74DcJ8PQQt5nQyAL1szBnh1jO3AXuBMhP4T0GipKqCrl9ayBGS54RNiwiJkmM05ziVx2+ZBOeVpyiFKQZOirmtu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630825; c=relaxed/simple;
	bh=Eae0L8mQX/HKRxUW9H1daR6Qu5pY1s+6r4QDDDv3MFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6Xs/BhZF83ZjDbnXZQwCAhMUUbzMeUE+Oc3GiQdKvr9s/Xk2B0xk3Xc6g86tVljJmnhSOzBgtREunbSYmVhqHytcxp9aicPsaUIlbk1ATIYC4YFpBfoKNmDDr9ogOJr0mNW72EUmj0T6NHf0IJxwn6jKpJzPmkL3d9T8IbC6Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso151299e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630822; x=1790235622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAuDoBRaqindrDQ1hoRg/L72SkatQaOp2VDi/OWJcsw=;
        b=I49z8r1uQWajdgZlQJkMWtd4hIGf7PtaD6bJGoSNNRx2+28JXaqhHBe92t9Dr4vZcG
         /QGVGnqTiT3Vs5HDKIk0SCVdgq1ZzLFCbgx/wpt1Vce0JJjrK44cvYyMBE1o/dm5nYf6
         UQB1ET6yMG+QrNtonKUdoZXbksAKKQDuyoyiz2nuibcTQSikvBHDGaQci8hzAQmu2B5L
         JEljFNLxk9KrV+nUD/hIx2P4XjukSeP9TI7hELUDtWnv6Nc4DDjeZH5JJSw71wTlmx0c
         gHkexC4KczW6mCMR2N5wqlmYz/u4ckjMnUSfTdkkoZg3/5D+pU+yCjFRan7zHSIwtY4P
         y/bw==
X-Gm-Message-State: AFuF++lWEGMRTMXCP8m9rFG77RlJQMAvsfkSYGVfKgLTuZhkEYYxXYTN
	I8lI3KC4qkup72xCmRCgUPQrntZizNYc02CKQfMTrFRaa2erXsMkercYwl+MB4uyep8=
X-Gm-Gg: AYBFou2r7ZmRv8yw7iSpb20JBu+h+zK5ss+UY4g4huMm9U2LDLJfG+73fBFa42wONqj
	AhkVJJPeshS2XVwVYp4t/mvk1AgiJgwETO0D/fJjfvwKuS5P6F6ldzdXHqbVW/46Jzry85esYxY
	UzC0qug9NzDPJBhbDH7nwCz4dmpIsF3We5Pviyne6pTS+8xODHJGspAY9Q+i5GzpGDo7A6yKhMP
	qakmSLuwVZvtP98SbAd9Y0GPAs6mR7MfGv9T47DnAX91aayxAnjxxtdUoP281uXAl06jWHO8thC
	bZatUFowpmUjjd6ymTtLqxk885FIXaWBupnyufLXUcXeAHQynTgH+WXqko6Hq4BIrXyxzZIWURo
	krr2kg/TLHWp5cYq6K3rbQ3qFAnfGy+LsOm9LngiFUPGwhB55S3NWy+0l7jnPndlXN1tFoD310M
	5ivR4RrKH2cAttosICIt1RQyL+6wM2Y9xTgy5CZMe38rIo5q7yRLAD3NDxVQa5L8cg58Q/VV/jh
	lIygD1unvlUnzBtygvlgT3uNlShZM/BYrfp
X-Received: by 2002:a05:6122:e46d:b0:5c9:a60d:3278 with SMTP id 71dfb90a1353d-5c9a60d39c9mr1490022e0c.12.1789630822058;
        Thu, 17 Sep 2026 00:40:22 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a53e8c61sm2000326e0c.11.2026.09.17.00.40.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:40:21 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so149083e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 00:40:21 -0700 (PDT)
X-Received: by 2002:a05:6102:a4e:b0:7a3:3d26:5c4c with SMTP id
 ada2fe7eead31-7a33d265f35mr120142137.22.1789630821198; Thu, 17 Sep 2026
 00:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com> <aqsMWn11lSgnNuVR@shikoro>
In-Reply-To: <aqsMWn11lSgnNuVR@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
X-Gm-Features: AcwNN1Vf8usG3tBt9wHCjscRiFJe7JD7786vCcIJCLuucE8K5jh9OFuAaTGdfmI
Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I have been using this since quite a while on R-Car X5H Ironhide:
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So, this applies for patch 1 as well then?

I don't think just booting on a system with a single spinlock
counts as a full Tested-by for such a complex conversion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

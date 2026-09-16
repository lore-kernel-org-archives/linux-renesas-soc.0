Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AF4534AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568209; cv=none; b=gSETHOKHuRn2Nf9/ja7CUKx9b/PMr+CTArCGkYfkWi9rEAnh/DuF+6xZl+bKOEWrglap096JoXI8VPJF9G+umO2E5b8nvM/rq/BufpgVIrP5WzJwGHWLUh8UcdM6gOMjgROXIj/bGD3B0iLkY1rtRIvkNMVl8moLcQsPk/RjQ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568209; c=relaxed/simple;
	bh=coXDW1UKwjEqw5hqQQ9LkeV6OHpNHzYpysQ3EUt3FgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE0ZvjTzQ7nSZjJQ60BpF8Gdc8ihJivbjXpv6Tsh/m7ZdI9XXjDm2HecUMHPU9HIGtmplOT2pyKV2Rm5MYtH0U84ul0uwl18reydTv35yC/LEOtD36PjzNp8IT0Jpa7yLr6Gwu1ta5DigRNiJc0NLnVAlHGOF6KBucEZFzZjbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e504d59so327424e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568207; x=1790173007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZHEC+8AwtULIzRYVyufRQWIqPmnKtw3N56/Q6kikwc=;
        b=gT0BYvBy63oEtMAe4dmsNr4njjrsuJqH3M1q3kKJSnq5I0+L056o0ehGSk9/HVMPF4
         lleddgYGPzs+zVhpwvibWhXrRgccr+zWZTFSuzfjRpVG+dOwnth39AuIrcr1LOipf8+R
         cSRo9y07i3S/NaUXNv/x+PJ825W8XcUBjdv0nP9Y0i+708yO4g8IAjH4kxvpw7SgPK5j
         YSytmcHFGJASYLMRV25ZVyw213vI/TadTpjHcZr70zIQhOH5e0jMCj/tzOc2F+l+xUMk
         wlt9PVlB9uQtajVfNvrSUo1KcP1sI1q/AhUSxx0tDhUrKlLdsPFzghrk+5wgvp7/0wOT
         K20w==
X-Gm-Message-State: AFuF++kyLRboKhhWvubkzPg+Dj3I5tyDH3XvCBMWBiqqWWudLCnT6m4t
	P4Fw3xRmdSDDrcYgRrPI/U83Pma9H2CpJBS+53/dSNsieh5OOvODz8D6c04IpZ9h4PQ=
X-Gm-Gg: AYBFou1YMvJhNTrXF9lfc6ZEVBd+RlcFBPEk/OEEjfO+tDTPCjd/PN2nYp+nVe4iX9o
	K+S17BAtgyMeATYKm0HRZYW+BH3JPUSgNv7LQn2wzqVWMW+hmh4gDZ4Jg82hwsXwC9jQ168OGG8
	fs7+uTPO0h24EsoccWUV7QlgsmJUnLWpr0Ko1LSYGRhBtPETIujTKAnUPTxN0noHD6JyVso4EDw
	clxbgRehgKw7t7R8FQg8Z7figRr6ZitRCcAhAUeOI78l2+LCxNnHGPYcbwfgNj6LNisbzhqINgl
	zQ20Rx5/EGHQMSWf/YKxdwztPLR8oG+mIOrdF/HtzX0bOyqgdC5brXQDhimxvGau5liYUNsvsP+
	bVsX180qcbiPg45ukavZ0dNVXQIfzNKK9MIUNzfzq7o7oYEtnImCGwMogXo/GvIkjusaTwxM0vZ
	JRL2tSltc151dgWunpUqASxIJKiuotjEQWyCSPXEXFSrNbizwlwJJOi9lawmYuUuIA2d05koYVA
	LCfYCnENa99uNOAJftabyZUx68CNrYvGW+skg==
X-Received: by 2002:a05:6122:e22a:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c99ac691afmr3021573e0c.3.1789568206423;
        Wed, 16 Sep 2026 07:16:46 -0700 (PDT)
Received: from mail-ua2-f28.google.com (mail-ua2-f28.google.com. [74.125.226.220])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831526c151sm2683260241.10.2026.09.16.07.16.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
Received: by mail-ua2-f28.google.com with SMTP id a1e0cc1a2514c-97e7c796e3aso303057241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:16:45 -0700 (PDT)
X-Received: by 2002:a05:6122:218b:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c99ab6ca62mr2524815e0c.1.1789568205123; Wed, 16 Sep 2026
 07:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
X-Gm-Features: AcwNN1XzX8LDXZHoO39ZbD09Ieg2WgEZcpweNI1kL3Ki-y9eZuEEawv4X8fTBcM
Message-ID: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 16:01, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > To help debugging, offer a list of registered hwspinlocks in debugfs. It
> > will also print the responsible hwspinlock_device and if the spinlock is
> > currently used. It does not show if the lock is taken because of
> > side-effects. Often, reading a lock means actually taking it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I have been using this since quite a while on R-Car X5H Ironhide:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C77047B42F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395490; cv=none; b=BgyPeFljrSPiWv+z9/RoQPddnz3kMsAP25H0Y5ygHXiEJqDw6d7eOTpktvt9s+Jpnp0+xLPxUGke/odOwJEFvWHxCXQcSO8FRb25jS2xSsX7OnxNxrYSvvBZuNTEJz2KD8jZaBdyrNGtBpgdp0MRjAlwXZTy0X0rxkiA/CstKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395490; c=relaxed/simple;
	bh=8ceMByd673naR3PwEiJsfobu32L4XCtKVcpdbpqYa5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2jEeArsXuRYcgfbpayQW9s1NXjvy8M0Wk+U0Sj9AY/j0U7OtX3S/Jads+J4+HYGASPUz0LQf0wsodrtmfmaiZv0BNprJ6GKKuaCnOSR4AKdnRWBCZgSt01L0CysSirgdJl5tF68KHI5c/ttvAWhG2m7B2NRC4frhVogV/cNrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b34face6d0so1359092eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 07:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395488; x=1790000288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0GO/2vfF/XubgIzu8oiJogl7L+f/XkIHsO6TluNVPc=;
        b=fChNkHeXXt8lEiSgefRx4VVCV9HiWOy5V85qL3oyOhe4Qc5x7O9XkDxPA77qKjsVwy
         wCDBPp/lEA9hcjWdObd5UBxusNltEHqriOl7DfBPTY5cn4pIsiPkyshvCbsKCDpuKGR9
         7EtbXlRTjd9Xxn0653ARC8Ax47dA1tceO23tw8QY52kRjm3N6HfbSOmzCRNHUQmwjDic
         ZXP2UTnmAkSHWIsCF5SQV86TRfu4DkXnGhGqZ+ItuwnJGsNEj4lR4PwmOecUD9ZPqLCf
         1c6c1oPfkxzmKcBm3bxiP44JM1ULJcvjynPrmVhegd7Zc3odRQB+N2V6PXc+L+H5IOzu
         X9eA==
X-Forwarded-Encrypted: i=1; AKwUvBwrbqlTcyLC17PJUlllvs2bylA69gwXW93P4RVyDdBkkhzKLqbrBh3LOLuLDZ4Ragz/srt439nPmQCbazFf3hLM7A==@vger.kernel.org
X-Gm-Message-State: AFuF++k3Vvhit0NmpFagzeciIyNf5I2VyJT+OGo6KRp6QtMDMZyyROAa
	YbHx33W+RWrroP+wNy55WZUzHNlFEiFetykSxYWoKYvkFJAmLEaIPTGlAIF0/t97OZA=
X-Gm-Gg: AYBFou3YKKcNH8Gliorj1k23xKjicwFBJ41b1TJ4l2UaFFp+1o2v/MUSTRFOFL9zZhp
	dzn1FbBOk613bIvjGfeR0kG1dYH+DAWBdje+PEgj2vsF4ePPogZnjNJXl4RuZ4MGU6dpCKWRRxx
	kElUhxDkMyArbqPL2csaH5Ou4OEFcggw/i9wI8lCvw8q0TMA/pRVKjkr1HzL7tasDmqRO8XODO0
	7R6EjEiKfFIOudPd3KsA0f68mz54Ld03mUjkFXjOB8QoWDUFbroAzZUThavLQujDk5gw7GcrJp8
	oRAy6iOmApZHRhXvMBtKtV3MyEfeJ99XzNbStKjnubUtvSSZRba2t4SfML0wnQPiO9FJfdbqsli
	198yC+EzIPLFHuLs/0gH5VP/pXrHFrAoRTKe5BpiqPku/9by5Fh6IvQ6VVQMxvuphwaGRn3MMXp
	dA71ePVVQNhA/47FUJcuYJdSbHr8L1qNOgilLtMQl5NCO+q8vk71dE8SaEuCp376OrYcu1zA5uX
	sxHUjoVcWw7w7fhkY7B6lTRRF/LnoU21uXWMw==
X-Received: by 2002:a05:6820:f02d:b0:6b5:ec2f:3574 with SMTP id 006d021491bc7-6c3cf6bdef7mr2362470eaf.37.1789395487616;
        Mon, 14 Sep 2026 07:18:07 -0700 (PDT)
Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com. [74.125.231.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df42b4699sm10225465fac.0.2026.09.14.07.18.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:18:05 -0700 (PDT)
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-7f4f1354076so362787a34.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 07:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySrmq949tvVtxoTvKGii4ovy5Bb+toP9hJzbX2Ett0arkz0Of9mYQG/Ba7dunwsEs0gjnaa0pE6fidOKO0z8/BZg==@vger.kernel.org
X-Received: by 2002:a05:6122:5315:b0:5c6:65e5:99a8 with SMTP id
 71dfb90a1353d-5c9749fed16mr2500859e0c.3.1789395132980; Mon, 14 Sep 2026
 07:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073058.253000-1-den@valinux.co.jp> <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVAFq4izexG=Sf2i9dZdMMNLnb85AVgBazAFMtTA2jwxg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 16:12:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
X-Gm-Features: AcwNN1Uyp_yKSLQHdhola9oXjT2PLkCEjRN0YsdOH8kD2k3alY3_Suk4gIB3dpw
Message-ID: <CAMuHMdWDJac0Soob+Cf-dgwWPBpGrfCwHDN_nWTyE84pXJSoGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Set UFS lane count
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palash Kambar <palash.kambar@oss.qualcomm.com>, Bart Van Assche <bvanassche@acm.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 10:44, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 11 Sept 2026 at 09:31, Koichiro Den <den@valinux.co.jp> wrote:
> > Since commit e72323f3b09f ("scsi: ufs: core: Configure only active lanes
> > during link"), the following error is observed on R-Car S4:
> >
> > ufshcd-renesas e6860000.ufs: Tx lane mismatch [config,reported] [2,1]
> > ufshcd-renesas e6860000.ufs: link startup failed -67
> > ufshcd-renesas e6860000.ufs: error -ENOLINK: Initialization failed with error -67
> > ufshcd-renesas e6860000.ufs: probe with driver ufshcd-renesas failed with error -67
>
> This is very unfortunate...
>
> > R-Car S4 has one UFS lane per direction, as described in section 152.1
> > of its hardware manual. Without lanes-per-direction, the UFS platform
> > driver defaults to two lanes.
> >
> > Previously, the core used PA_CONNECTEDRXDATALANES and
> > PA_CONNECTEDTXDATALANES to configure the link without checking them
> > against lanes-per-direction, so the missing property did not prevent
> > initialization.
> >
> > Explicitly set lanes-per-direction to 1, now that the validation is in
> > place.
>
> Given this breaks backwards compatibility with existing DTBs, I think
> this new check should be relaxed iff the DT property "lanes-per-direction" is
> not present. Are any other platforms affected?
> Possible solutions I see are:
>   1. Skip the check completely, like commit 06a34d9c1f47b923 ("scsi:
>      ufs: core: Skip link param validation when lanes_per_direction is
>      unset") does for ufshcd-pci?
>   2. Correct hba->lanes_per_direction based on the actual values of
>      PA_CONNECTED[RT]XDATALANES?

Both solutions would modify the core, instead of the platform-specific
driver.

> Alternatively, ufshcd_init_lanes_per_dir() could override
> hba->lanes_per_direction to one if "lanes-per-direction" is missing
> and the device is compatible with renesas,r8a779f0-ufs.  Or perhaps
> hba->lanes_per_direction could be preset in ufs-renesas.c, and not
> overwritten by UFSHCD_DEFAULT_LANES_PER_DIRECTION when non-zero?

As ufs-renesas.c does not have early access to hba, I went with
handling the quirk in ufshcd_init_lanes_per_dir() in
"[PATCH] scsi: ufs: pltfrm: Add quirk for R-Car S4 lacking lanes-per-direction"
https://lore.kernel.org/ae0cc2bd764e6dfffce99db3d8b44a55887c508c.1789394185.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

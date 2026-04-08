Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6037358363
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648743; cv=none; b=l2lY6UcSZhmAm2IK87mE42MFHUXJkViIp1cVxnDJiT+f+Ivcx4iBwof6gq7re+CL0hW5xkiQpLkv3p19DZA7eiJYhDIM/p8UjgUc2JjCk4g4M9S+9+cP/muqlwhSW71z3DI1w0OwwoK3vw9Gpz9ANxxo/Xz/wHUNu/PkOXr5oJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648743; c=relaxed/simple;
	bh=tMoYbEmWbo19OX+Xq3VZmzh7ETPBDAACXNQrrg9Kxr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACFxINmuCANaEw+CUfPmIZR/BRFVM+D5AZ14TYrlYoZgzTzPZJmpewkBwXXxhHtWRSi+puqtJz7Nf7U8iuzgFPIw+sFhcHEawYEAZVeVNbMPNfhLCHiSd5fpUBFZBY5fzoiaVS0HTmztTBfjT7C71QTydssiP6bYNiwhKY/PuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5675d609621so4989304e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 04:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775648740; x=1776253540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsFx8UqI7O7MvtKnezUqmqXPysfihd7yNwHTW94peVE=;
        b=fhw8Cc2gpsuu0rNKDWpf7usPiu5iWCtlcGmPqYsYcPpVxQ2uU+/UdCXAb0fKZitJ9T
         7zzFaCadBPKH2hmTMM38JkqcshsW22gH7s6vKsLOLhxFZ73Czp1KCSt31aOh64Jo64wu
         WGyK5HDA9DlqD/u0RNO0LAjA8rCjGM5BN7UCLoKf27R0f+etDn7BLDJhVY9AnjIEgcgI
         lQDaGVn7+09u6GobLQp/BMKL2I/3AW1hSjT4kzTp4tSl8RvXTugXZ1XBM2uiRQG/AHoK
         GaX7EmEjkzzzfKr+TESHmriws6y+URtgvr5zHfDZr41OGwwMJ0x5b1a34VKhzDkjCL6m
         3VpA==
X-Forwarded-Encrypted: i=1; AJvYcCUG4XdHriJNC1qTJcdk/+QlsExD24C5uUUgdrSzoNqp4ZmVdjEl6lUC0ND9BAfDu2vEuoZe4BGmEU8V3DQrZ9ZTxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkHjHvy+lojk+IAt90YkEv/QVvAngTn0hFxXzjYcuzVBa87Ta
	ZoMRLF72Pf2jAehexA/05vas1ADaSZb72XnbXSNuZLsBI+bZu6AG4xOc71l0WcJJ
X-Gm-Gg: AeBDietwl9JPprb1seVQkmri38jcLWXp+WSPVoT6/guf1TlFXqTU9DKuPuWMUCJRue0
	EYkCMUxRJR63GVZ+qMeszfIlUYTxk/GCWe6V0yHU2aymTqOZF5PaWD12cimtyTgQ7CcwZkR2ySh
	9zOlznUpOYH9JxaRSDtXaLJFEpwEWJD63O7WJf2yqutz+pS5vukbeZPJEw7eqlqFD3hUhDi1tJA
	Zf5PIXBIlP9Ib9XgQUJCDuWbG4pOUI/8Rxh16/trdXUbzFKzRNnWIj+EksoBmYaj+Es8Hwu5c9S
	VaTMHSxe198tn1sbv6aiopt35uuoAWrFcO1QHvKjRT4nPZLMYUyg240RIsot5OnbE+gIEzG75dP
	veBrejcBbXb287FE2jYO73m26/qk/1QF8wP9c7GoE/ExiBgoc33PUz1a3eR7U07msw1eQMehdUM
	iWOWfwHIFaAoKfBo0iaOuZ6gNv/NaYOJ34rDVwfRXWj9qfeNIhhVWIWxNZ/cqKqw9b
X-Received: by 2002:a05:6122:d1e:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56dab830279mr8955746e0c.1.1775648739921;
        Wed, 08 Apr 2026 04:45:39 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd2106csm19861483e0c.18.2026.04.08.04.45.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 04:45:39 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56efdc96b05so1800485e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 04:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl0cuL41xAkM2rhb2AK3ZWXD3k5zfUE4aehs4RL+w67vA/Jtun6ct9d51wKTKT+qx6JBiAF1F8J4eS93W2SZWGIg==@vger.kernel.org
X-Received: by 2002:a05:6122:1687:b0:56c:d582:42d3 with SMTP id
 71dfb90a1353d-56dab9f0300mr8497547e0c.14.1775648738222; Wed, 08 Apr 2026
 04:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 13:45:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQiRpCVMuimOMo4Mz2EAG+gbnKyXY7oSXh7mL_fkdGSQ@mail.gmail.com>
X-Gm-Features: AQROBzB8CD0KWn3WV3oznk3HkPNWE_QHm1fcpz8CRur8WDBn-SeBp0BUAOGU0qs
Message-ID: <CAMuHMdWQiRpCVMuimOMo4Mz2EAG+gbnKyXY7oSXh7mL_fkdGSQ@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	biju.das.jz@bp.renesas.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Fri, 3 Apr 2026 at 13:18, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> During system suspend, phy_suspend() puts the PHY into Software Power-Down
> (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the KSZ9131
> datasheet, MMD register access is restricted during SPD:
>
>   - Only access to the standard registers (0 through 31) is supported.
>   - Access to MMD address spaces other than MMD address space 1 is
>     possible if the spd_clock_gate_override bit is set.
>   - Access to MMD address space 1 is not possible.
>
> However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> kszphy_resume() clears BMCR_PDOWN. This means MMD registers are accessed
> while the PHY is still in SPD, contrary to the datasheet.
>
> Additionally, on platforms where the PHY loses power during suspend
> (e.g. RZ/G3E), all settings from ksz9131_config_init(), not just the
> RGMII delays, are lost and need to be restored. When the MAC driver
> sets mac_managed_pm (e.g. stmmac), mdio_bus_phy_resume() is skipped,
> so phy_init_hw() (which calls config_init to restore all PHY settings)
> is never invoked during resume.
>
> Fix this by replacing the RGMII delay restoration with a call to
> phy_init_hw(), which takes the PHY out of SPD and performs full
> reinitialization.
>
> Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/net/phy/micrel.c
> +++ b/drivers/net/phy/micrel.c
> @@ -6016,8 +6016,13 @@ static int lan8841_suspend(struct phy_device *phydev)
>
>  static int ksz9131_resume(struct phy_device *phydev)
>  {
> -       if (phydev->suspended && phy_interface_is_rgmii(phydev))
> -               ksz9131_config_rgmii_delay(phydev);
> +       int ret;
> +
> +       if (phydev->suspended) {
> +               ret = phy_init_hw(phydev);
> +               if (ret)
> +                       return ret;
> +       }
>
>         return kszphy_resume(phydev);
>  }

This function is now no longer KSZ9131-specific.
I am wondering if this should be done for other Micrel PHYs, too,
e.g. by moving the phy_init_hw() call into kszphy_resume()?

Ethernet after resume has always been flaky on Salvator-X with KSZ9031
and R-Car M3-W ES1.0 (this seems to be specific to R-Car M3-W, as
boards with R-Car H3 or M3-N do not seem to suffer from this; don't
ask me why).

I have just tried:

-       .resume         = kszphy_resume,
+       .resume         = ksz9131_resume,

in the KSZ9031 entry, and ... surprise! Ethernet on R-Car M3-W now
works much better after resume!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

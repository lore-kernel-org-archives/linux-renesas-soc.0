Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F03BBA0A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975533; cv=none; b=smAGITjpXN3e1tdSqK32WpcRwlFnu/PqPN22tsmiZ7bI/MzJpxUff6qAFCSDn/sVHZrGHKfSxmJl0r4khz8kVygzRyYKAXKRNVnm5jn237+5PKcIfNucJNKNpDubQnLmbrHfR6zDjDoAoN94+CCUB3vvqquJnr5tu5vWPKXZLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975533; c=relaxed/simple;
	bh=6tKTGDS6JtG90Il7+2qAPduVfkvtwUyKRtM8IGgWrL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQIr9VDEzal7gmFtqL0AVO7dE/alW3yWdYkLs4mjTYhuaJZBa2cWFKWtFv7b7+mQgAAvFR8nOLCcYC6K2MEDn0KalENBpnALUeG83IivelBwKWWjm10V/jdlrj/TF4vGns+myXZB4qrtQ0DF86c9K+2F7M9hAHr/ph1loS4nlDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83be8db39so1527542e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975531; x=1790580331;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Z1SbtUTgxZShJMFyPJ1MYGOC5nK1asEC/Nf/hEw6KQ=;
        b=G1r1L4td+4vVqSJVn2xdzHymdiPk2eBhjKFnlSZvSj/9hAxTUf8jLDLVcJNPT0ApHi
         NGQi8Pbrd5Y62LIes8taMZ+sXBWeyxbLP4PP09xixHGzHp7QzEpvz2fqR+qFXDwf315c
         qxhFat2Ll/ctDYw5aWyYj4aA6bSNWL6ZyB4Ny6PooGGSH7ll0I0rwuqrNjngMXWrWWxG
         svvp/Tla6tUOrgKmzMlejW4iDyFaukQWkgYUtzGvy3esHCn3PhwMqYRWqpTvyFhuIq+j
         Z1c9bxFquHpz3D0xzMjgGHL7VaJ7m0V2v/Tz1DuZDZQeulyd1Slag7YjbOoX/PTBrUcW
         UqWg==
X-Forwarded-Encrypted: i=1; AKwUvBxSS+Jm5HTL1i/dr71vaFwlBfjQb35wBPZzEfIt8s751P/4gZxbop4z6iQMQ1whz4867ENjNJRFrz/h2l4SajXB5w==@vger.kernel.org
X-Gm-Message-State: AFuF++lhF4GKKbTntQr15HtOSBbsnlGrqa6h/u3Gv4HkofpaRMlgAFrY
	fUwoG6TldlbqYZlTD1sxRhVsa4JJ0UI1oA/S9Ad56QQq8Z+lYw/qmizV34owukwv
X-Gm-Gg: AYBFou22/APoYMwwH+2vASdUoaVVICzIHlNIQ/NEFp1v4/xMqTbVYPfH/2XfpBNz6nd
	r0Qb2t2GM5DYiyf0yv/bG24TBcn0SZnEojzNjkCCPaY+E7JsViXlnX9pdov3R6Qt8LgwK6siKDh
	Qm/dNPkF5OvCln3y2rNn3UrD58HNYCkkiDubpvH0qss9pO6ClJRsGMjf5y+EewudeHN24c19t3w
	+yeT1LrVcLzjfcgqgOCOKzc8hxWFCJm2JBhXvyU6171jRttosNsred6tTaEPZw95qvG5o5TmRnp
	h+U/Oe7DVSnc2abPzI+nP6fzxFTy5Wqw9C+BzikTBGnPzerfYv/RJWgxYcBN0c0OCRHlCJo311L
	MWOAuJCh40hK6GHLHBkOxz2RteZmeKvN/BvLWNaEJdkMdSLwK1X/uIK0x4d2X0Ndo4MdvTzJwzO
	5k5MOmK7wcRGNHyAUE3H6Kk2O0q9CzFjeBshBO4E+SD8VNDhmCLPs19XkDZiizxAHonUwjL0tMa
	GS5DxmmCGKV51etcvKUIKalx+Yv9dTn+4/kTYWczCP0X3o=
X-Received: by 2002:a05:6122:400c:b0:5c9:a60c:273f with SMTP id 71dfb90a1353d-5c9b59f02c4mr4205554e0c.23.1789975530697;
        Mon, 21 Sep 2026 00:25:30 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c40a44d1sm5639215e0c.10.2026.09.21.00.25.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:25:30 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78569cf871bso1704467137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 00:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTCAOIKXEliTsdkK0zmATKZD/jBIkwK5ks8llRGUAjYDKH+/rYCQi1ANZ/HHf6PeuSRaGiK9vZg6d6U+vV3YcqKw==@vger.kernel.org
X-Received: by 2002:a05:6102:41ac:b0:7a4:e550:eeb9 with SMTP id
 ada2fe7eead31-7a55d28bba5mr3601642137.22.1789975530039; Mon, 21 Sep 2026
 00:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <60988ce9c4913014e255ecbe127e93374f6a2295.1789570538.git.geert@linux-m68k.org>
 <20260918200033.GA1667835-robh@kernel.org>
In-Reply-To: <20260918200033.GA1667835-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDmZs1f+co7EcC8+yp4BU8iNo-1c-TNg6Xe8nYLeXOpg@mail.gmail.com>
X-Gm-Features: AcwNN1U9s09WD_Fc6q3FVUM3sMCtDOgMMGz5EOC-0K6lXxufMm3wQwxnxJmg5fk
Message-ID: <CAMuHMdXDmZs1f+co7EcC8+yp4BU8iNo-1c-TNg6Xe8nYLeXOpg@mail.gmail.com>
Subject: Re: [PATCH] spi: dt-bindings: Relax node name suffixes again
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 22:00, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 16, 2026 at 05:18:27PM +0200, Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > An SPI bus node name can have either a unit address, or a suffix.
> > Commit c4fb6880edc15866 ("spi: dt-bindings: restrict node name
> > suffixes") restricted these suffixes to decimal numbers.
> > However, SPI bus node names with suffixes are typically used for
> > board-level bit-banged SPI busses ("spi-gpio"), which live at the root
> > of the device tree.  Limiting their node names to numbers is prone to
> > conflicts, and may cause silent overwrites, especially when a stack of
> > sub-boards or expansion boards is involved.
>
> How is that commit an issue 3 years later?

Because no one cared about avoiding future conflicts and/or no one
noticed any conflicts?

> I've commented on the case which I guess prompted this patch.

Yeah, "spi-ws-2ch-canfd" referred in the Closes-tag below.

> BTW, "spi-gpio" or "i2c-gpio" are not good names because you can have
> more than 1 instance.

Yes they are bad names for node names.
I was referring to the compatible value; sorry if that wasn't clear.

> > Hence relax node name suffixes to alphanumerical characters, so users
> > can write more descriptive SPI bus names, which are less prone to
> > conflicts.
> >
> > While at it, reject empty unit addresses.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202609150228.Nh4nZzbQ-lkp@intel.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Other subsystems (regulator, i2c) had similar issues, and numbered
> > regulators caused conflicts before, see e.g. commit 45f5d5a9e34d3fe4
> > ("arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name").
>
> I2C was a case of "too many to fix". Maybe time to revisit that.
> Regulator binding is a unicorn and not a bus. I really want standard
> names for buses given that's the only way to identify them generically.

Aren't "spi-gpio" or "i2c-gpio" (compatible :-) nodes unicorn buses? ;-)

The issue is that they all live at the root node. How do you name
them in a conflictless way using numerical suffixes?
  - On the SoM: spi-1,
  - On the SoM carrier: spi-2, spi-3,
  - On the expansion board (hat): spi-4?

What if your carrier board supports more than one SoM model, with
a different number of spi-gpio buses? Oh, let's start at 10 on the
carrier, and 20 on the hat, like we used to number our lines in CBM
BASIC V2 before Simon's BASIC gave us RENUMBER ;-)

What if you have multiple hats, each with their own spi-gpio buses?
Hence node names like "spi-ws-2ch-canfd" make sense, IMO.
When the WIP connector design is finished, and provides separate name
spaces for the subboard in a board stack, we can revisit, perhaps...
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

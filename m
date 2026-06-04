Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE047DD55
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580234; cv=none; b=khMVxq8USy8crNHfEUocZBptWFFZHNyJCvALu0hoNSFwG3x5OAMHYACgsuVoNqONKzWlfzrSu7RluUoOqzI9hKzYXGVIQSRh7qnftksu2/gH9lTT0EDYnmZ8h4910wzQD1Cies+To6yLjCoRT6dfqJy03CMdZNlWqMgWQ9vi7Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580234; c=relaxed/simple;
	bh=UgIbMUc6XbhuclV25YQJD4R3U81Nf51u8wUxbex7Fwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z51ZaT4JpLvU1/WVrBYlLCuEz2Xg4aHcbg0Wn6UbvDbocZi5OclIUcD450C7XYNqnyYTvO6ZcrXqsrTab7K+c8dfxaCmYUMXDIn/TJH4iGDz9RkM1U0eV4TU9zEKBcY1bRSjTLinHh9FJQy5Zg8Ti5jWrbTAnh8Nmg2DoxxzrS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963ebce7076so149436241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580232; x=1781185032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbc9H6Sodchbzo9eJFs/pRevavF6zt3cn3QmUq2TwY4=;
        b=fBtPXZ0Avu8e1Dut+2tT6yh9rs/i0HOSwSSuCGH1QZ09asR4jgnl6tStisqJ1GM/Vm
         JRz5cCweMF1LngFoRymSRZIjiy7efgDCHYJ523e/P841DmwwQKO7ygs5PIPYVNtbGS3o
         Z3jAGxdTaPkj2gbSzX6EBe84AcKNKCleFv4W8DtJvmzMa4R+z8eZB9osuxFlSVqukT65
         zixypKTwMrE+3b6/mGRZiV+fzv/SN1kai4KNLSUuV8Wt4X+8pPTmnPFdxWhdnK+X5ul3
         M9Er/8KTbDv7x0XpPv/U43VZ5KmD64fp2KMeM6RdikVX8xxOGLOuVBEBedBi1t7pPjzT
         nb3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KdCodnCchOCF3kexduUEOZUHsKTHPaOlazM69surG/IoLfUg3WjQrE6CMW6S4V0FZZQPsUVBTrM3I4lgS6HmeUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUWbU4DnOfl+GoNYHhATnTxNMEKtWkfn1Za+AKLfge8xaQ/He
	7MpqU4rC7yhI3NU3RsNgp3c1yhDz8GMr+VBK9K3vTsnBsxrsVqi3KkwRO2KUP3Jebwo=
X-Gm-Gg: Acq92OHijZjCZM+xxF6CBplHAZ84ntk+hEBP4xEI77kWOarsifFFe7nPiCdHTh6Tbkd
	qE3d8pd+Zxqwn0qAvlVSwGFhJUl3xMBY9T5xtMgVtElcMx+aRVmQhSsX6+EgWmuAd2lHpyi6OLD
	g62TTGimGi5T7Lg3spvBQAZRqnxoqnwei7AqBVvhqlJceRabKB4nWK9M76UjKBW73PzkLWmtiH7
	iZVijv9dQkUzQeHxEtQVsFC9Iazg5mMv2geuefiYZW5hftodwFlI5h9dIQ2hTALuIIkbFGsP/g7
	xMCcJUonh5gPcs0tzyqEkmz+BYmd3ShmUnlBAPC6JE8owxDV+5lMFtH49saAEgyDs6BIqkhT9ay
	IFuiQ664kYtGtwK7+tVcPHfuslAwDz7A+/hKQSez1rAyf73PKnCPo06kQvp+01Ir8+hkSyAi42Z
	P7TGgKckOj0g1KsJtSMmgiPOGj5bChgBi+2nIdSF7QvIAEZWOJ1/KLbD63IQC916z2QobyHgE=
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr4506918137.6.1780580231606;
        Thu, 04 Jun 2026 06:37:11 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5764dda8sm4914591137.5.2026.06.04.06.37.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:37:11 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6cfc776e451so222041137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:37:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8UUikkg9GMOalvAq+swKLIB1BgHJBXK0ukmtqKlgdE8DG2IZ97G75XJRd1GLa2EjWb+he0iBTYR7HE4qsoZb2h4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:5812:b0:6d4:ba3e:bf97 with SMTP id
 ada2fe7eead31-6ec2a7e2ef7mr4555261137.4.1780580230878; Thu, 04 Jun 2026
 06:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:36:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8p4ms+enMYSzOU1nceh_w7UfwvTuLwk+5OUOhfej_jQ@mail.gmail.com>
X-Gm-Features: AVVi8CfjLgrPCeJLjfD6K3yH-jwvL8Dw6l53_F7pY4rGyGZ55Qm2c4WwhIt32_Y
Message-ID: <CAMuHMdU8p4ms+enMYSzOU1nceh_w7UfwvTuLwk+5OUOhfej_jQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 at 15:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Configure the drive strength, slew rate, and Schmitt trigger settings for
> the sci0 pin group shared by the RZ/T2H and RZ/N2H EVK boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

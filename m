Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6D405C5C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373435; cv=none; b=Dw381IXsKy6an0cxcS3Y2F2BZO26ZbErXF4qWEKpHxmqnRkyoZVZVbyrJ6SMMYzzVs0hiGusQ4hk6qw/U8ynoYNdli98THBO0enF7kD92F5IkMAFO5ngB/rpgMaCo1Pxbcq6A42Zj0NORkN/6ih/zmWo8pjMPuhMCO+HhfNm0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373435; c=relaxed/simple;
	bh=n5rMYOLB08GVMHx1R8PCKx0D3UZSKzHrcfaS81rxPSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCg851q0gBRCOwMEf41GechUX2OYItxcsH3/VRT7N5d2zD1AZe1lg4h9FU2jHaNdAH8tmQGjNyEs5h6SuGsx26xUfjLIjj+VAXyjuUfAfWQS4Be095cFRmrhAiKPiti+hYhN6i0OcD6bVBeJtxA9HQKchHPjIZXN7ZM7TxWkC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so1700545e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373432; x=1786978232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDUVqF9bGKPqsW39iH6LzgBQf6STHLl+9ztnXalCrFc=;
        b=kJuGBLU0jEBNymb6CfAU/FGyNghWL53q/67K7FjEGkpPQ85E4HQcw0Rim9aOyVgyg4
         yBBEwPHyghkBp14wiEKI3AVRfUjLGnH7e3Bw/oxT234FVKecQ9xHNU35Hcwwy8gLWIKc
         228ZYxl3ju9ZfkdtnXkzLIybk97lLy6zwryDqreGU4uZorEMhDIeOq42cXeJFbS7L7Vq
         YhmITaELqAsWCAv/uBW2CP8/GOJhquua8V2zTLeD/wUGuTQKUKQbnDnMxh3RTozaGrlZ
         BUoXhDEw1KTInReq+oCorceGR2Xa2QxfKuc4+t7bmCVSZtnIfo9PRX44yCoiYkUXbm6e
         vKPg==
X-Forwarded-Encrypted: i=1; AHgh+RoDqF1VZV1cJUyP+WvBigzm+uXVxkvsMQx790AV0hsW0wyE8EcDqxBcoSqUfYRhktXdsX3gZRQ44IP3EMft+zQbrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztXXVUbX1recXp4fF2Nh0flZan+yhaQ7HdbtWTBg/KFnbJcaxO
	85dMPjnjp7dqUGz/KLKgOYvcKL+SYJfP4Ny+qtmmXVwcLnQcH55qH2YlFSwCd2si
X-Gm-Gg: AR+sD12tqZZqmMjukUp10T1Fsr1Gngrae3TxvCh2UrzVXSgaf+a3C0wLcOCbEkrDU1t
	5zieimtisGrxpA4b3exUvHhgYaMhUTMcd0qPzZ1JLVN3fGep12ZDM/KTUshy4+PxO9Ra+hH1vjx
	UmevOcegOh01G7IbymHJE6NuQ93ckg7Ngzkk6yyBBn554ytyeTCuUFt8A7feGlUeUoypyWxiEEs
	OpyaF4gpswb+tpOxSxgrT8Z88zwPQoTc+rsNvb4UIF9cTfId3cJmVuJArBop6rYy6iigC67a36U
	aCBS4aLnTkxFM3YNN6y2Io4igss7C60IAaePP9lUefE9vkLiVZberz3dEZJPk1Y/HEYaeEf8CP7
	v5DtRkAP0Y/WovvjWuIySFC6dYxeRTb0JEiRUlNY8eSEG+tcXLBbY8vyCZte28RsS8kVhJ+wNE3
	Zg/+w0J0bUOmIbin00GaS2CJix8Y35m+R9oVxf2GBER0ZQRyds9VjfZD9gImpSqqhuC3+bggoHs
	ipaMTNmOjxFh3nN841nOyDTnB/vdmJyaOgJ
X-Received: by 2002:a05:6122:4a45:20b0:5bd:b47d:1865 with SMTP id 71dfb90a1353d-5c41535b761mr1597557e0c.5.1786373432422;
        Mon, 10 Aug 2026 07:50:32 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b20d380sm4418390e0c.15.2026.08.10.07.50.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so1516167241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpFZyeTbbbELi5OR0PHXSgQWuG0G+nPAGY9M3Cp74VvnD1geYv8Sjrjftw1n6llxbP/GdjDqJSC0edcfurQScpR/A==@vger.kernel.org
X-Received: by 2002:a05:6102:2082:b0:74d:5456:b6fb with SMTP id
 ada2fe7eead31-7652241d10cmr1596982137.16.1786373431244; Mon, 10 Aug 2026
 07:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
In-Reply-To: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:50:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
X-Gm-Features: AUfX_mzSDh0l0A6CyrHddRhefJg-h_HSruJEAkSrbmndCIqd_rMaLktXcM1WovQ
Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series adds minimal support for the Renesas R-Car X5H Clock
> > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacin=
g
> > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > These two components are closely related, in the sense that they are
> > both supposed to be accessed through the ARM System Control and
> > Management Interface (SCMI) on the Ironhide development board.
> >
> > This series consists of three parts:
> >   1. Patches 1-2 add DT bindings and DT binding definitions,
> >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> >   3. Patches 5-6 update the DTS.
> > Note that this series depends on v7.2-rc2, due to the use of
> > <linux/device-id/of.h>.
> >
> > Changes compared to v2[1]:
> >   - Add Acked-by, Reviewed-by,
> >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks()=
,
> >   - Drop fill_clk_map(), as it is not really needed until SCMI remappin=
g
> >     support is added later,
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >   - Sort MDLC nodes (alphabetically, by label).
> >
> > Major changes compared to v1[2] (more detail in the individual patches)=
:
> >   - Add default support not using SCMI,
> >   - Drop everything related to SCMI.
> >
> > Note that this series does not use or rely on SCMI in any way.
> > SCMI remapping support will be added in a subsequent series (old versio=
n
> > at [3]).
> > Full hardware support without using SCMI could be added, too, if anyone
> > would care about that use case.
> >
> > For testing, I have pushed this series plus additional work (including
> > a rebased and updated version of [3]) to [4].
> >
> > While I know it is getting late in the cycle, this work (especially the
> > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > would be good to have it included in v7.3.
> > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > Ulf: It would be great if you could take the pmdomain patches (2, 4).
>
> Patch 2 applied for next, but I left patch4 for now as it didn't apply

Thank you!

> cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

I guess your tree still has the duplicate "default ARCH_RENESAS"?
Patch 4 just adds a single line there, and the conflict should be easy
to fix.

If you want to send me a new patch, please let me know.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

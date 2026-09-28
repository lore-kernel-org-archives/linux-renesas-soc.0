Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC893D1CAE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600552; cv=none; b=dxTga3mY2VmUpbxyeDRmkoOZsCxdNS90yC0JXhyivTY1//ghv6crYTgqszxPVd2KEsYtRMhjKjuM+8TpbNG/akCcszGvRGUQj291fMwEl44ErulCdYtk8iOVjddrjxUG0Myl+kRXiPK9qs5VWmn+kBmQCu5qwR+bA4YOiu/v+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600552; c=relaxed/simple;
	bh=MNgEkF9rzvNLwkhHa+USMkamAutraVbddo1NEhjIddg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTUVMYJXl+8+kQ59gF1+OPaFsEA7qBQhaqCIyu70abAWi9qjnjpkDYAhAvFQJ5WbtuHh7kaCuNsKmFLW+YOO8LeXjrT3kYkakQqScBZrHRNll3USLA8CRNhIVtple1C5Sp56VoZh9U0nswi1X2IPfoieE2qHekybFcPxSp/0sOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so2330314241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600550; x=1791205350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2wjW2JTwOVXb3h1ozyQBNpHWe/T9o537b+crN9rr4kg=;
        b=DXACbiEGy1daW2z4oadfjJ2TWjWPFsFpVRtzpX1n2XnGHOrVWS6KLAYnA/VV6W47B2
         hfWPwyI/lJ4dqp95LtnhCaL+RYnbz49jOJCTwcQqEbbOQjIRrvkJFLVS79x4rBmqm47D
         Q13v++TZ1SCqnQ9+DB1kNU6f/4yBYPaXu6+LTLbkFdYeUFlwDU5Jr8jgJ1wq6H9nihEQ
         N9jixxuUG7Mw91kn0/aRx2a3RVWWJG5AZ/uXyfH+rqfcljaaKHAWePYu7vTdO8UxijTo
         5+FPzVhi1C9ak/+jzoh1qeINGT9rBxiCDNZXGyUPNOqKoxiBiBQo4u5yeqcJEjNToBZk
         iFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyE+WnoMkgLw5vp7Qopei5TSYr4gnlsixCvl/i0japldWARdHi77lInuLjIPexjGryB74L4yiut7K8i2jcgBqq7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbGL259uRGrS8kNBx+IESCZVvCPFbv5+PUkuJL2BlUBxCu9aD4
	FhZ4p1c9z9ogTKXxO1prqD0AVa+AfMkVRYgycB97kenuGsHrRC/aXcFrgFIYElN8
X-Gm-Gg: AYBFou3jsv1/XqVMbRsd7dYOorF9a20pO+z+NXpHxOIWuPGEfIjVCM8v+dFRh8ktPmh
	pOebmHMS7YUiNechJzug7DWD9fV4gmqRYc5C7CDaNdiszWgWR2ZNugdSy8YhjtyoLQEXtZpGqQT
	o8cdL1HYUQpNuT2O0Ex2CYDE8IFwswkIaoH6X0i7yaUJnZ+LwUSH/reLYe92VranqLUzJ0v6rWl
	IbPqp+/EJzOhBRO066HUu8I5Yw6axwwrmof64HD0pBn6lL/S6ZQYVtz1nm5X5ABvCI8A82opypt
	Xbrizk2+X3u17HhVAgqn9vvl05ZJgwDcDjDh82W9NWOvf8LlQHRbwVU64ldheUZQnFxpi41ekgj
	5vLZkPNFwQBDCo0rte+X0yYIsGTr6dwkLDJkOnXBrsjaDZ0GBVin0OEeCIAidjLrBbighTSjGXE
	Y4VxIHVbyPsEnOMu9XyH5embGWX6CipfJc4sZWye4bJuxKg2ePYA8zJQ94oxG2llayZsKyLVIrA
	d5/8Vc8BBdvp12+tTBybAOaGlvWuws7LJJh3VXyt3g+4K3/
X-Received: by 2002:a05:6102:3f8b:b0:7a6:bc69:5a32 with SMTP id ada2fe7eead31-7af1e6f3640mr4867083137.23.1790600549653;
        Mon, 28 Sep 2026 06:02:29 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5c7csm6922184241.2.2026.09.28.06.02.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:02:25 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so1791261241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcTRH7tGIjbmHjUCTUgxTaJlXGpqN/wmU4fOZ4SiO5H95r2S+5ABlcm8NfEN889WlMCq/M/I4NJMAIeh2etRkE9g==@vger.kernel.org
X-Received: by 2002:a05:6102:3c8e:b0:7a7:c789:888 with SMTP id
 ada2fe7eead31-7af1c799ab1mr4246322137.5.1790600543175; Mon, 28 Sep 2026
 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
X-Gm-Features: AclHuK9PxP9o2Iptr30yrzx9bl3oQSb-6qLfwXQyJV5JcRh9RYQN0Hhi1zaXUYw
Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a779h0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4M documentation R19UH0217EJ0110 Rev.1.10 , Jun. 30, 2026
> attachment R-CarV4M_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p10.xlsx row 411
> describes PCIEC ch0 Application/Local register reset. Add the reset into
> both RC and EP DT nodes of PCIe controller.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C603F210B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015658; cv=none; b=n+T6UXhdL4/dT/UcTZpeQE8Nsga0+kFi2vGU8olLE+i8197o85vbJurBE5sq0Z631TxdKba+CbbepTMxvlv3aw0HHwkPkgcNkMxiE5ZQJwQyLN5qexYb/KN8T+QcTXVDf9qZjQUjgW/wgBiGY2RWRdOmD7pvG9I1Z0j5QRdgSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015658; c=relaxed/simple;
	bh=THxugq6t+PDXlFGTMulIef3VfnF0pxoHGHT4/GfoOOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONs9WukvZ0cHd6R/kf6F5AkWCl6vHpPWHntWqFi5j6VoxwhQp0yk4y8NY5alEIruuh2mpJJXUk/kRUxDnSO32oA2E0yxGFoZJFmttWSA7p/aHVXkvbZ0MYhsBJ6YHL9Tq5zUENhkEAuVl4M514crB6I05c5D50pK2FPOBOwjoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-735f73287e2so412636137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 00:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015656; x=1784620456;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgRx/9A4mxiDsRVEDvyTiz/IgVDal/aTcWb8tkjr7jw=;
        b=iHoQQJ4UAHFhM587hxJoCbmtDgoCCLBaxFKHkMHq3gmewPxSShcC0Pon+esyrIzCvu
         f4IZmbiQGGOx6rtRtu72/1X+fbz5s4l0DOCLMwwLxXT1IodPU7ggYShenCucjuEv6p2v
         55qr9fPTh+5KpgUO/y8mqNZ3ov5cGx49tsu5V8ZQCoUq26JO6lk1EHELtJTXZCJ/A/xR
         1Ha/v3XLdP4+cgBTdwZ7Ba2syWLwpFif5mrXjttRMHGy2yRrJTYU+67BqE0Y7NO69Hm5
         WfFJigOqfQ0al2v6Djeec5WS37lev25lBokMunsDCVE+VxWwxpqACoZO5xh9XSOGxXyd
         q8YQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr62E23wHXJzsCheQDJjy1AF/yKbvNqXpYIs02jmmfr1+1N8jILLzZ5Q4gbx8fP2fL2BaMr2F/HpMps+3SPK/Pfvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AgArFX+B73xomNQIXgivM3T4dH2CgDwlFcGXRlwjOexgXQQq
	UwKXahQ2LYtsXXugsfWWDBkkO1uxXPayR/53YOyT9Vy7rNP5aTscP3dfD9lOOj5+iaQ=
X-Gm-Gg: AfdE7cnwlvXDj4sKtoh/WN8TG9qHO9TTaINquDdkkjwX2KQtU8AW0pdPFse5ScZPbj5
	vgv+tXrPqouDcRm06CpkMJqGWKID/f1CmvtM370s/MR5Ia4U11ft3fVdIBAB/nM53cYwAMm6r+r
	DSJ2+H0422IpRehlew9cgKpDiF6pce4O2VNnSWF9Bjp97UmA8jLnxN4z006dOeKHbQHdcTvpTOy
	RCnlJqmLBi2TkczShY9YHnDTWj+uV8GXODkaMYsibvgLvuY2NfwQXSU/HPbOmMRNbqV2ETh3kzw
	8SWoebHSTboLAWHohO09sNze6ZEMUf5Nq0cIJVKXpn3n1FFF0NM0d1maRHogMBrAtr1ugk0E949
	FwDSVTg0+TATYies282dDhhZlupT9EspVX9xRzNOyH/ND/dZpmeOtZVX9z5UHQcDdSDnoYtVMuV
	3j0YPeQcTItXCT6/hX49GSKWEo8Kso9ZHB3ZReUPcYSYhtiFLz42mrlQ==
X-Received: by 2002:a05:6102:4499:b0:739:d787:bef with SMTP id ada2fe7eead31-74533e6c859mr7635386137.26.1784015655844;
        Tue, 14 Jul 2026 00:54:15 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed258bb75sm8771847241.1.2026.07.14.00.54.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:54:14 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so324148e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrT+Qrc4iHWzxgKClfSqkwYICGuP5dJhm1lSCMWse59iDVCeQenvg4fqMXpjXxiGP3hQ9kV6wZN13WPy7cx2HofpQ==@vger.kernel.org
X-Received: by 2002:a05:6122:83f2:b0:5bd:ecad:8f9c with SMTP id
 71dfb90a1353d-5bfbf172175mr7212570e0c.6.1784015653328; Tue, 14 Jul 2026
 00:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713175400.GA1258926@bhelgaas> <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:54:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
X-Gm-Features: AUfX_mzs8lWdOW-5Jg3BgK8EeDUWxqE-PpZFEV2XQkTM46SmNqGtsnsDEZCmeKI
Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> >> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> >>> On Thu, 09 Jul 2026 21:10:03 +0100,
> >>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> >>>>
> >>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> >>>> copy the one GITS_TRANSLATER register offset macro directly into
> >>>> the driver.  This repairs the ability to build the driver on
> >>>> non-ARM non-GIC targets the way it was possible until now, which
> >>>> retains good build test coverage.
> >> ...
> >
> >> So in the end, it is either this patch or limit the build to
> >> arm/arm64 . At least this patch still allows building this driver
> >> with more compilers on the various build bots, so I would opt for
> >> this patch here.
> >
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
>
> I can rename the macro, or ... sigh ... I can reduce the driver to build

That would obfuscate the code?

> only on ARM/ARM64. Which one do you prefer ?

Just add the dependency for compile-testing, just like
PCIE_IPROC_PLATFORM does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

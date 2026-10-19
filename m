Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4B448B80
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393600; cv=none; b=Zk18kGpNmeEq/qPfIKrb8R02TcCA0zTg5CrHKla5DF/0/ykB3LG1mduLdA3f+TM/X9Fn8HTebyxFHwB4mDYIUl/DACMqqnyg/kCoRRlRdCFEdnpAL3KRHk15zuj/cRxP1CoknGLe3CppQEdI5fHJeXyVHrNK9ABIl+VA0oZymyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393600; c=relaxed/simple;
	bh=P8xJGaUWRfCF8FqZhZvElxrMdxQK2gqfDHniHzz5j+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIeprSIh+bhiJaOvuPd3lZ1Ly8fpxdOAAhkxAW2OsuBFm2gAUzgvPZTI7Zjk+YiOYZMC3Nr3M8f2b0sIztAuq2HKQ4GkDg7w1yk3Cp0kHzCQWKGxlfYzmEmhusbaX8TdEr8s9NtPV/4cKEjMWCr1yGLFKgkOKbJ/sL/colqodqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c03744ef27so429740137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 00:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393598; x=1792998398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eu8vGumKNUEJq0ogznls0IACooxNZPVx2SWES3Vu4VA=;
        b=Q9nvRhkZRpDbIGu/mhDQA6cgkpDYtKAUuGJhexbCGXqyzcQveKY4dmfRz29IgOs1nL
         ub4M4p3H9UU/Jc6RADCevNOnCRqx1p1N7te9bEUlJyajYafck0LS/hF17eWvJdZVTcWm
         B7K1hbr3Myyuhc/Mhe2xirIKxHsMp3pGMGPYlnE7H6CKGyT1Cpyp/NujFpOHQPL3gn1+
         iZN4DpJs4/TMCOvjATV4sY+tIb/8WCN+EQ0BWe9aKAx6G3PoW8fyNJLE3CBLWb+QElhQ
         HICyKU42yIbvavAdBPW4bhFDDrkM+iAKy/u6J/dI6V4YbYd8PjIimoIUWryddNbD+yzA
         f7yg==
X-Forwarded-Encrypted: i=1; AKwUvBwhSbRVSYDxk6cH4PDftFltyQZ/UA5X9bFQPuv6c4vwFZgazHRAoFdZmSI6Ohfe4xSHlKdfynlackT70a2ITKjQaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2RN/+/EUKK6jy48qN4EMnXUqz7Cc7RwBAwYeDgHnkULKWzuZH
	dzktKGufdfFQFJYDMvkVNdpeaOrwaBbz8IZulgINha44O7pFImNTaafYckgdAmkC
X-Gm-Gg: AYBFou2T6fDGh1fofMeJjOLN5ChabAy0kTU+OKACcf8LqFFhCLM0olHrTMczEbRWa/X
	YNkaQVx9t7URoMOqBWpAlmmbcMFQcQ01vovijZqPRn6ZxP/vFxmMow9eS7bfHzQMriBc1vKZUfc
	9/7boefiJbsdQH3d4orEjb0AMalONF/dNuAOa98wYjM+QAVHGiY3SunV4xLytYtNSxq447y4g6t
	4cJAFMuTKj9j8oy4in4LuTEfHjN1W6ETa/eZMqdGXXwUPRv9FMtLYBmNq1J9NFjD10Arm9zC65k
	lQIvvDN3xMgK/im0cDTtrQ6vghmpmjkmVsJIDN+7TthIohQ7LAR/wKDcjHBv/nQh4F6fuNbx6MQ
	GzYSTxG1rcdapEOi2d6YDWLatqE+uXost1tXhwv8v9TNACVT7WKcmrFQzoquaOMUtekRifZUPEz
	GPkA7qtF0Bn2DbGnO7vlagW1+xx6rBNrI5e3Duvfi6i4n0IRWIAB/rgaVuNG1EfIFSnFHY6NJcc
	4L4zY6SbKevUI/ZfOuZAc3prC7GBoF8VWwBA1uu
X-Received: by 2002:a05:6102:3911:b0:7bf:d9dd:82f8 with SMTP id ada2fe7eead31-7cc36a18080mr1428237137.21.1792393598000;
        Mon, 19 Oct 2026 00:06:38 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc197e73cbsm9126594137.3.2026.10.19.00.06.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eab93a9862so269632e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGuzX8j2Nl9blrROJb9Pjflsy7DyOItVLMOVnrUdSWpC8DrLVD/7amc3b/rkayM/Le04td81AV4K9SaeSItMREBQ==@vger.kernel.org
X-Received: by 2002:a05:6122:f1b:b0:5ca:fc48:5634 with SMTP id
 71dfb90a1353d-5eaaa419d47mr2207684e0c.11.1792393596973; Mon, 19 Oct 2026
 00:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004011851.866833-1-marek.vasut+renesas@mailbox.org> <atMEOFH8isshAwN8@debian>
In-Reply-To: <atMEOFH8isshAwN8@debian>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 09:06:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
X-Gm-Features: AclHuK8T-_1RFv1uF7KAoei6UxD8kd-EB3eCG1Lls8ceu8LKgfvwrJWWOjqTf_U
Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
Subject: Re: [PATCH v5] PCI: rcar-gen4: Add missing PM ops
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Koichiro Den <den@valinux.co.jp>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

On Sat, 17 Oct 2026 at 07:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Sun, Oct 04, 2026 at 03:18:13AM +0200, Marek Vasut wrote:
> > The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> > and V4H, this is an always-on power domain which is not shut down in
> > suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> > which is shut down during suspend, and the controller loses state,
> > which prevents the PCIe from working after resume.
> >
> > Fix this by adding generic suspend/resume noirq ops for the controller,
> > which tear the link down on suspend, and restart it on resume. Use the
> > same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> > PCIe link on V4H and S4 too.
> >
>
> In the future, if any one of your Endpoint didn't allow the link to enter L2,
> then you need to set the 'suspend_poweroff' flag for V4M or other SoCs which
> pulls the plug during suspend:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=f845c1e2d2d4506802244ea2a378ae7b04e90bfe
>
> > Test case which demonstrates the problem on R-Car V4M:
> > "
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> > $ echo s2idle > /sys/power/mem_sleep
> > $ echo platform > /sys/power/pm_test
> > $ echo mem > /sys/power/state
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> > $ diff -Naru /tmp/pre /tmp/post
> > ...
> > -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> > +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
> >                                           ^^^^^
> >                                     Class 0604->00ff
> > "
> >
> > Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
>
> Note that I changed this fixes tag to below while applying:
> Fixes: 0270dbe4f891 ("arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes")
>
> to reflect the fact that the V4M support is what caused the issue, not the
> initial driver support.

I beg to disagree: the bug is in the driver, but it was exposed by
the R-Car V4M DTS addition.

To make life easier for the backporting team, I think it is best to
list both Fixes tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

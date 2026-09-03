Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F14AE8C0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439710; cv=none; b=MLP3LJ+J1583Tsh4R26QOGLI/aVHd2K0U2JiY7k1on+RVPMqRZGPPU0uE4kjm/PEwfzYOqBbB2GY/F2Gnck+O8UIFU84H0NWWdgHJlEPbpvEs2CSJJksGlw9I1PkfP8ydGL1ZupbTKCJXtFhvQ/G3IelIaXtAp2B/o1K/Fm8vXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439710; c=relaxed/simple;
	bh=52IhV1NlD8VpIKm2oG40lSwrnp/KluZG7LbmqWFL7xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcenMoeqab2nZ2qIUnEbehNrQLHOsPZvaAvn8A1WvIdJLrliMLSNq6uz5OXcMZd8OVivqtty6jawsGEleLm8gaSaBwnrRcn2f3z97ivTnRKZL1hJ2WQX/T7k4v50RnQfK7pcjyaCbFJNLEk76fCLLh/dEuSuT8M4ILgHsgWotHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93900ed2925so211180485a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439708; x=1789044508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4aThBV/MKXRTLxxMP9NP7CiDSYoBXBhVSup6n2UINuQ=;
        b=XUdh7A5w7+ZWleRuOT9rrYlMLelREW+EznbQItxVX+8YzbdQm1E+8n23emgq1GDcYZ
         Vo9eNgVyuBY/sOPTLEHAJCyv9J1HRCuuJkHEssKXFdIPJ8rfcEM7S470Ak8D97+FOHU2
         Xr6Ew4rrSoJpLY14OGY6UfDO/p9fsNaTL7hHQuyuDcfamLJsFe4MOxz845xmiPUYARlX
         qsB+HjNJPb+bsM0veDs//0042z8FuVFmjWdp1/4imHcP2rxwp7pBf0KISkG9v108H7mQ
         3Q945C9+I7E6hFLheTRyoxUnu4spusz0bvAl4bnqWrzCh/0xDRm0Cpw8hdHcQL9lY3MC
         zjQA==
X-Forwarded-Encrypted: i=1; AKwUvBwDzJoj4dn8RHP2GSPv3Wft365O2WMovgQVKoUceuytHcR883kdLHJ/aWo+/ZzIE1yLp+fDy+QVkgqseGuBsmlRrw==@vger.kernel.org
X-Gm-Message-State: AFuF++nlE+WjATxaKfqjiTSWCisJcHu7ZRJ7fcho4WtitZmKq0tEd9kG
	FFKVcTe/s7e2WIL9JBeJooFxY1eyI1L+L/+Pp52xVIl+obB7l7jIlRF13wfqGcQBWSM=
X-Gm-Gg: AYBFou2iKgyUF1vbf1MsNoLyPfdzjR5C+PHbCz4ZmhW17vkZfdi2h1g3yvT18TL2Dwy
	N25xPaMvqP6K+5Bw6XzR0QF1UbAVafXK7PqfTDsI0trqXOlgdtkJq/0W6/Pi+Xwgq6NtO8dv0zK
	6DMQQ8w4uruhMsg442rdjq0zTfsJDZEQhpnmcexeoUNK5zCuXgy5UB3xfZD4qbkcDGQuJbve8RD
	8BcyfVWMu9/SULTEis4CUu4+3dUKkUx1KVZBL4PNdDJ8Fl6XVOCdCIEvD46v5IWej0j8azdbD9f
	o9s4sVT3yxKa6PUUV1jOfdvunNLXb+ItYzTYLPCGBc8OJU3uE7MScjRrIr/r4BFldCCxBx2OOpZ
	0fy/0wEzs9G073lndzLWGPqElM3mpdEb+odcCvKV67487PHTJx5k9TIg6HZZ3qbyQB7Jelv1dC+
	25hm7UkqnXKm5p4qyMFT/goi2W58okFCy7U33ofUkBpYbEXnC3lBk9bmdPcSyc2zPyPyYQBcgOq
	aIwjYBJDF01IYUqe82d+1DIRQ==
X-Received: by 2002:a05:620a:bc8:b0:939:d38:3ab8 with SMTP id af79cd13be357-93960ddf416mr1491110085a.12.1788439708162;
        Thu, 03 Sep 2026 05:48:28 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1ae7f8sm490320885a.18.2026.09.03.05.48.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:48:27 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90c522298d2so30018026d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:48:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBkf741J9VsHgzGYM18c+R949LEtKB02CZXkgzocU4g669Sh9etgFbGUMz1XY8oFLC1mfXDhVFByM/tTBQpxMX1w==@vger.kernel.org
X-Received: by 2002:a05:6102:330c:b0:786:fb19:d5d6 with SMTP id
 ada2fe7eead31-78a1f19f88fmr5114359137.1.1788439321117; Thu, 03 Sep 2026
 05:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:41:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
X-Gm-Features: AcwNN1Uzwrt2F_57qLud1MQRI-EP0blNweC_SW2rpdknAoyXWxcnxu0jErknhrc
Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
> PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
> some key differences:
>      - Has 3 clocks compared to 2 on other SoCs.
>      - Has a different set of reset signals
>
> Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml

> @@ -87,14 +88,18 @@ properties:
>    interrupt-controller: true
>
>    clocks:
> +    minItems: 2
>      items:
>        - description: System clock
>        - description: PM control clock or clock for L1 substate handling
> +      - description: PM control clock or clock for L1 substate handling

As pointed out by Krzysztof, the "or ..." part should be dropped...

>
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aclk
>        - enum: [pm, pmu]
> +      - enum: [pm, pmu]

... this can only be "pmu".

>
>    resets:
>      minItems: 1

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

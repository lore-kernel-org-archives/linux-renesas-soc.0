Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2651355F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797159; cv=none; b=NjO6R0SSlZoga6S7n9YXHToxARbknbGS/jaktMFl8vkgCAgRYvx1mvVkS/5kg85HegQpR2DysLfxVIRcKwam46J0CbYamHirHRiv0G6V7kXSqCCk2Kzv9wJc5/6VBWVLRMi0s6mvXgwbehNuwOFoHFfmGfApnWA2/Y1ZIU80DJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797159; c=relaxed/simple;
	bh=hU7eRYQ2L+6W3KSv4c0PzkTILRIgPmu556oNrVZACTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTvu19MgcDGiS+PlJtEnx+cEl0VZMwQf3f9lvooUSqIjJlRnZvtuwfkr+yyB19HrPTkh44eIVDnzC9c3tjTJZM9bMZ1Ns83t6/nOXRZHf+2A7bzHeWcYUz5eNtcrZV682nfVNnHJNNSum236O0rQ0tavP9gFOASZT0Pzi8sff84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso1675467e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 09:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797154; x=1789401954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9kwN9YV2UIWR9vTDW/+7DxPdDKrz03iqFaixNrlJ+1U=;
        b=qEt1Avb1cu0ljPvyKkmGPNDhvN5lMEzSJXMW6lTIMs1mpduW/fIR2jBXpt2iMinPcK
         drWD1HiB45dVMXYVySFKMmbcSs4HZT3Iuphol0fgxyZVUnQSm1hQQOyn2rJVRLCNqnVl
         fG4MJitKMIhSycvFbmZ2XQUPfmUW70esIRYA4TMPa8WY76yZw1B2FfrwyEX6SSWX90ql
         iCH48LXqUwmV1Ym48wXCSVlxGCopLwB4y492ztzk/vK3rkQqr6yMaVaidjjPSenjG9hO
         q14OjwDNb7lk3yNMsIQ242iNxZA+Uhf75JG/kN6lyCl2FrM+NLpUHfuax/fMYX6Vbdfw
         zi4A==
X-Forwarded-Encrypted: i=1; AKwUvBxKIYmqPx/qj9bD1dC4kSOQM9C8XLzftVdr4ovjzBN9AqP/AEDGJQiEc2sEKqf/2tJhJsn0wCez2XcQKzG/jEg6zw==@vger.kernel.org
X-Gm-Message-State: AFuF++mCZom8++9EDQSoo/Tmh9JytdloNIyXziSy8gTY8+NxSNWysq2c
	aKm+hvi9WSpQPqAN04asxDHN7hsIkz0DCcL0HT9qBWLkmu0kys74qb+WdN6LMHl4
X-Gm-Gg: AYBFou2bEbySoBHcHoJVgXFZzlWbyaEmRai/mQd8MFKGcdEoucH1L/79weVLfSJ6a57
	7GT1SWJvBq5e0lF7ejnltf1kxd9nKEh/7Cd9OBNyTF9J9PhiBDvOGVWbIyQiG1AAkYL8UZSXPfc
	QaiW5mAsa+vvHVVCqxfiS9t7giJZoS19FbfZax6QhC8iZa1tFGZRNvPGlyq+s7brpRxxiGLA9S9
	p6sIk5ogOBz4QizH/fuKjb1Dx0q5wP0VPTM4+UP4J/O5+Bhjk3CGDlsML/ZWCrKcUDnv+kCmJE7
	gTSx5ziuz7KWghswEY5oYWti+6/g+Xt+2u1nG8JxfQP/0L+bXbrXeZ5i56S8Poo6h+6ytORIVSE
	eRgvIRr0eoea7LKvrUGX/KYFQ13UmCjYumwLHQWPV5DlXWfECK5vD8h4/tB4L4U+nnstOUkmfcN
	pblKt9iw1PXoQYIreXp0iycQNDxlNF1FiymtIf11+wW/1sP1cCbKqkYeb8l4Eas1CiBSX6brISp
	Y2JyPV9WbIgLmUxcW5Es1blREqOfA==
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c7ed087c0cmr10548632e0c.0.1788797154375;
        Mon, 07 Sep 2026 09:05:54 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm8059379e0c.2.2026.09.07.09.05.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c7991578c2so1605166e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwP8k3y3a6c4+NiPDpMfkNtrxTdOgQZ1o98kvDYXNt/kD3E3iHg3slwlVgtQ1XldqNyEMGaLrtXGRcC7lJB6OV7kw==@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr10980239e0c.2.1788797151556; Mon, 07 Sep 2026
 09:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 18:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wm8DHsL2a0zy-uAEM1hkCTVJZKfNb68aES8fX2T4VBPEpycd5vofPPqGA
Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Add missing PM ops
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

On Mon, 7 Sept 2026 at 17:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> and V4H, this is an always-on power domain which is not shut down in
> suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> which is shut down during suspend, and the controller loses state,
> which prevents the PCIe from working after resume.
>
> Fix this by adding generic suspend/resume noirq ops for the controller,
> which tear the link down on suspend, and restart it on resume. Use the
> same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> PCIe link on V4H and S4 too.
>
> Test case which demonstrates the problem on R-Car V4M:
> "
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> $ echo s2idle > /sys/power/mem_sleep
> $ echo platform > /sys/power/pm_test
> $ echo mem > /sys/power/state
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> $ diff -Naru /tmp/pre /tmp/post
> ...
> -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
>                                           ^^^^^
>                                     Class 0604->00ff
> "
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> V2: - Add TB from Geert for RC mode
>     - Use pm_sleep_ptr()
>     - Call HOST suspend/resume ops only in case the controller is in RC mode

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

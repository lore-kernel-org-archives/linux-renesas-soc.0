Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727714A92D4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440400; cv=none; b=cZj4ZauSRPjrntugjFLbvt3/ULjnEu9YGYUS79kHcNunMDJdmgZ0UVHd4tD5kbiGSrBvZz262IBMqVG4bMa2lb5RuAHzUWBd2fHVpB7RcIFVVxEPX4yrtsnRatFpIeQpwVrNZLTIqFPLJ302P8O80/GGc2CeDYMUWiIyqmR4MSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440400; c=relaxed/simple;
	bh=dHxgVoXugnnTmSqU/QbhM/ywN/YiWktpg4R2HHANpxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVdQMSCURiEIzLOV2LTY0WI0xY32075Z8uWA6sN/XwjGHLeEtDFoHnnIe3ipCMVgcN7ulBmluYAme5E8l8wm43RZunzjrQC8DGRNlNGJyFWfxk5bieq/nrF0M04bKUwJtYPMz+O8C1U0rY9jG1mI93N6hk9quPXGcdQs++SKTck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso2054741eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440397; x=1789045197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOaM/A6xTTi3n14xGii1RnS5RLxKPImxgE8KsoH56tk=;
        b=lV4Fg1Hj9YdfrjcUeyo3MaqNwX38icGvz8ngpxxNgutvbsxiZP3IWQ4hMMKnr2sUEY
         RxSjY4qEb7usDT0YRzD3dyeWk/EVYtg32LPVJ+/fhmPPSnkAYZcCoUQ4F2ej6cpUl+uI
         6ectQoc24kXe9Wa1/uH+TqOF9o3aoZkwxAI6o/Pi79st912D65j+2d2hVP5dF49AlH8G
         V3b/Z6iXoxl+zGpeE76cZhZkqEDNPjhY11wmqn8YCAi2jX9s31+Ik8SvSK2Iwlq2jWsT
         IlKqkO95YNi+u+fHNDSTpfWnUNYzDMkicbtnZYZ9lWD90ObqKZZQIL+3smu8I5ch4ze0
         nd/w==
X-Forwarded-Encrypted: i=1; AKwUvByrotRF5eLOC6qazn9p7flYAwxneWtspYLY1+Zrz+es9xj8Uq8VCXSugsRLqH1Nar48jP3PV/Jc+k3o8nesXqGabA==@vger.kernel.org
X-Gm-Message-State: AFuF++mV+kTN/GsilVpwUXXtg87qtCsJyxjP7P2yq4n1jShPsIZ4Ez7/
	DcexTvRNmaTGxxGlxFnOflQrPLQgdNwwURkY1y+TQ2iO4qMDLuHzj3VWMeD3RY4oiZY=
X-Gm-Gg: AYBFou19PCOBVlh4rGGsG7+DSs1A4/7xChsoOgLbP+kgGYLxPHSclJEd8zClrDdY96X
	cWzEBIRR08kWO3cxPC88JPe4zT0qDqjfn6c9l2XWLrndtt1CNWQ5hQR9I2tc4H+H7OBHUUSA3QU
	uJmz3GrKG6F6K9IsO7+BhhJ7BNX7ZcRrGpFIG8WPVO5BimHsDhdUh0YK/Vs1YfuDFEYK+y9qjXk
	GvZovEoVwLedGkYU+xTwSOeYesc7B7BOzIzyVn1roAcL1kO6XLdmdVtdRr0NShSfHe/hWIzSzi/
	gNtmKqfuuP5RhkmlOflkmOp1URjS9lbafJTZgK8Ct+I6mrRbiNENRe0+gah6DM9RcdTMMqNC80g
	PW1ZbqFSd14oclo+aDvqRHMDIcOTr5fsLYivYUBNPvTliBhGh82o0TWftnvEeld028/GPpTkmwY
	Ei/fHTbzu1bX+QDbgzTi/vWKMG07hGbW6E5+T3GVUvGp32mB5iY40XVL5+DRY7VR5/vkkzmVCpG
	i/Qn7lVFvIibt5pLfg4W1Shlw==
X-Received: by 2002:a05:6820:199a:b0:6b3:619f:25ce with SMTP id 006d021491bc7-6b47eed806amr9682498eaf.30.1788440396681;
        Thu, 03 Sep 2026 05:59:56 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40c833ad9sm4883396eaf.7.2026.09.03.05.59.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:59:56 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso2054711eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:59:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXHl4uCDfaBJjPNvr/BcyMPSzl7+UBTypVugN13ugvQUAoxiKcuE3V5EcFYnVcRaqxIeGXPNpT9jBXkG4eWMuUXQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2c03:b0:785:8f76:654d with SMTP id
 ada2fe7eead31-78a1f4c036amr4772497137.13.1788440012478; Thu, 03 Sep 2026
 05:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:53:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpMW4GJzgf6MSw+rwNjw6d9sHnR9J9NxoKh-2cXJwNLA@mail.gmail.com>
X-Gm-Features: AcwNN1WEDUqTnWdhnLOvtpe3Al5LdzBVrMsYUowriY_1M3N1Njo7kHKct1Dq1Gw
Message-ID: <CAMuHMdXpMW4GJzgf6MSw+rwNjw6d9sHnR9J9NxoKh-2cXJwNLA@mail.gmail.com>
Subject: Re: [PATCH 3/4] PCI: rzg3s-host: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SoC-specific data for the RZ/G3L (R9A08G046) PCIe controller and
> register its "renesas,r9a08g046-pcie" compatible string. RZ/G3L reuses
> the RZ/G3E config init/deinit callbacks and power resets, with its own
> L1-allow syscon offset and mask.
>
> Also increase the timeout in rzg3s_pcie_set_max_link_speed() to fix
> the "Failed to set max link speed" message seen on RZ/G3L.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

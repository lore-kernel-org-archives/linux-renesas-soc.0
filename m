Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483417;
	b=XtgMGjND3eYjSOoqh8JcY7z8kzb4i74vdGQvS4Z52Q6GHc+X9HYZiWD4qHZxll3vUA3J
	 WAzsgql/65tdZS5agEycvzbr9KpGGjqkud1P7vbftxeAwuNAzsJBNpZGuA1s7gk30RZjL
	 Qe+440RDnZq3W/zLN8mLfQJSg4JWZaYZrGTupFWlOz7KqTXFBqlxPAXnbOXVlDL9R1FU3
	 P+QMf9Cqvzn8OSn8ugSYg95XMMARxINDrMww1U46veY3BY7ulG0Y/8Oy6WzmvAjUyACQ5
	 SjW2QPwwB2Yk4LgF8Dt1O8kTfgYZNPickruoHutEjc23CLCmtNzzfMwLAjJXoL6D+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483417;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
	b=S8rHDiRjfhXTh0v7Fu6x2+AIngqFdDjnNFh1L7z5SpmgfsVH0qOVxIeZ/TCYcDDw7Uzy
	 HnVfhMPgTQgVDzW8aag++fr2ieSL9N5EFEzytBh4+f9aNuABghBDiUOxl65uscLFaSFYr
	 1VnB5xu9BQw3Y80fhhDA40H3tgTbJ8dP2eXI2NUEDw8Mj/g7z90ndSnXEJphp2jmn/CfS
	 JXbHAMXIlSCe44ZQ8fAOHXHeKpX4SY9RfMndBqgo1lXHGfIGBF74PEATml5BbfXhM6U7s
	 jqfdVHuIQJypg+ubhRbQ5K/oPu/RX6/X9ANDpTOahQHDQuEAkrDU7IuzFcAUwR+sicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177B606A31B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7177B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eadef147ffso226343e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483416; x=1793088216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
        b=YEXXs/OdEj4Pb7ebalhZxNZ8305DCI4+UY7nOnz/zi14ABg/JCo5vKNbIln9FzS9w0
         2vnY/ZYQvAMLcGrB5YsE0hwi+G7iKeTxPQjLMFz8pY4s649UMJOsHbnbXstDPkV3+4RE
         S6k+B3ohyfFqlwmv4fjTVtfxLq0DaCqoDdCWYw7/hq2AP0TuuUNygM0DXcR+1JFbJBBe
         shppvlyGw4WRQG7zqHk7h3A1lczs0ye2+m0XMBWAyxUlFtV7N+ACKSeIEamDBS5dzngz
         Dn/bUZy3RaqFXylIV3gcbDdghBkMekszVHkqi8P46czXn88oKezoCHzUvBVXPMVv6/ta
         2QaA==
X-Forwarded-Encrypted: i=1; AKwUvBylIbn9NJ7ZCK8z+dPwmEYWYAbY60t2Wgk7d+314mYszTtJlMC6i7f413AmhYcGclgojxjPGrkQxKqWQhifRMTSTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJOsq0Ms67II6KVrnBqeQvbb2rYy5Yjp4Y9gkdSLUuZcxeQzs
	7oN/B2D2W7Doy2MwTYfEcmSNIM/Qj2DeF2FVoPsI8PX9mKCEG8dTt9+S7F59iX5G8SU=
X-Gm-Gg: AYBFou1s1YGXKz+6218zXKF8ZG9RbC/uv/pdLP8hyKUQm/C/pW88yZIpEIYHFwSrA/i
	NjMJ8ZmR1iTNmjgfJFaAC02nlrY/GGhZamJ9pQsQ6LsggGudbzGetmKRWmkTtOpDrugFT6SKGqk
	n8+uwXqZK+1Mmq9xL/6oy7lzLoV8bfBYQC7MOh1Fd0D3WrJ7dl+8TAv2G2oUWmK5bVcyAqkJyD5
	4cO29Kwsg7tkTu/v+1AWuWb9WM/EC33uZGQK2f1Dt51P/J8zDDnNcfljbwQcaV5BMzm+MumTN6k
	S71a0bZS1vDPdgRGBExblUQAvoGv9Ck+weUlYTfeSWOY71v5HhuvbFQBbuJ6uHUjeJ3a+LZqf7b
	5S6g1UN9TASOVGiuaeiz5lRcluU7OkPtLYcX3YUqPQ4HT4e+um/JDSW+FjAJ9KJgcbCjh9qg86n
	15hxNDixK2YWiH8SPNJ84j4JZZrdQf7E2M9TkWOOfLBDgA+cG1TRLIyeTlXE9RW+suO9EaNhKrv
	EjqnUL9OVyg0ZZBYpgcJ+DqAGc0G82XMDYxyk+ANTcvz40=
X-Received: by 2002:a05:6122:341a:b0:5e9:6d96:a598 with SMTP id 71dfb90a1353d-5eaaa621c2bmr3581567e0c.6.1792483416398;
        Tue, 20 Oct 2026 01:03:36 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b476852sm12453580e0c.6.2026.10.20.01.03.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:03:35 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1748085241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:03:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGl1ZBFXbSz754t77GerpbfWSs8jQMsaJnq8RIFSu9+RyMB2tgzHcZCsypkP9qAOaRXejirp1d0vTew8PzFVGRwg==@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:7b3:4199:2dd7 with SMTP id
 ada2fe7eead31-7cc364a1700mr3331202137.0.1792483414556; Tue, 20 Oct 2026
 01:03:34 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 10:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
X-Gm-Features: AclHuK8DND9FbZy7IbKb735A7LxSnsy1udn9Z5wpI7Xg7SlqXYAKq5qlFx-pakA
Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] PCI: rcar-gen4: Recover from link down and route
 Root Port interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

Thanks for your series!

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> Proposed merge plan
> -------------------
>
> With v5, this series seems to have almost converged, so I'd like to ask
> how maintainers would prefer to merge it. Any advice would be greatly
> appreciated. Here's what I have in mind:
>
> To Mani:
>
>   I'd expect patches 1-14 to go through the PCI tree.
>   One option would be a two-stage approach like:
>
>   1. Take patches 1/2/5/10 through controller/dwc ("PCI: dwc:" patches).
>   2. Once those patches are available in controller/dwc-rcar-gen4,
>      take the remaining patches 3/4/6-9/11-14 there
>      (the R-Car driver and binding patches).
>
> To Geert:
>
>   Once patch 4 is available in renesas-devel, I'd like to ask you to
>   take patches 15-17 together.

I don't think I have to wait that long, as there is no hard dependency?
As soon as the DT bindings (patch 4) are accepted in pci/next, I can
queue the DTS patches in renesas-devel?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

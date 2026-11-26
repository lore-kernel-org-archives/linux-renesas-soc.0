Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698624;
	b=zGF/NTd9L2fnU9FqwohIOopkJ8wHW/DRVP94nKGkJuxQE8TwtRydsaGK5N+zPIF716DX
	 3ousIFGmtJfj/HW0DF5C0222ZKusl0Pk28xG3i8fbOxA4bLPH9Qzuu2cpNKAgwIZEgQrH
	 ICOBtvjmtqqxzzE1ftq51MvNdgexHBFRvw5aIYMS99KZygygQoTRdzKRSL3vvPV+ObaHt
	 2apBKqdbozxg5o70gvMCxLzyO03T3oYgzSse9flpyWAbKTcPpGlzJPvtFIWy0w9OTia6g
	 G8cscZkmPWwIGLCAkWw/4JHYsj7U1/UyhTaQEGkh83/AtALkZPhE57wRkd+tJvZCZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
	b=EQhd1RObU+6L3YeePZVT8O+mYnE9c4YHidxJCpBwUP6hzgTVpPi0wnQO1E2tZlU2owNt
	 xtvB+/NAWDpKyXA/3O8+Vu2a3dG4SXer18D2ueUvhgGNSf4wXte1e8u9rYKy1hS+6uXCn
	 HsiYe5KMHsENt8029SsWGGa+/24QaY1lyGEMqZ+hmvuJ8pwhDCHuVqrlPq8c9faDBkOsz
	 b+agQYNwYDtrODwz/2yCoZPkCP3J5yyIC3cNaEf6b72W4XXAvEPPq1gEpfP7ljo+0dh83
	 RDkcLGb2PF50TtkQ1Kj+UleMlGWij6zYj8yhjfIMzD8MOC0JBvgzo4kyhhXIKZEVbZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0E606A31C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d6554d96d3so3956458137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698623; x=1796303423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
        b=LvklNi0XeJFRkxowt0cMKPAXli9njv4E8cs8fAz3jg8tzGufEJl5L+crQk4AwX09rd
         PdZEmirD+5mF/CO1yN7tJrfNDabzp3egRftaIs9Ps0qhk71mctc11rmG4xLKM4dJJtlV
         SbfpxlysM6CuHkNAIouv0IEBLYPI1Yd25YpoXOSXCEaalnFn1FNfEAk6SmL4d8Yh85r+
         mZOpJzhwozwZgnXQ+6lY61WS/Lg67aLMMbLtGa/08e1oXfUId5ed2gv2xVhh4tefvPRL
         v68melsPE0A5RLYaW4jZHmXR3Zd+bMrenQZgFa1oZg78mU8XTQzBgjGG4kgpmM5lcwbB
         migA==
X-Forwarded-Encrypted: i=1; AL+hErGOfkHcdWoh8EpPVFyQBapm3Bgd5fp7pSLZRbc77ot60uBE0voGfJHXVWstUvoSNHpCfgZ1tTVcweyVYp2izoWGsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9v95YvSX4husAQg79iI1G7zVNvoB3NVSbxVAwabyR2qPHK+wfr
	7KcZ0O+eAPlAkw3i254DDu/rgsjwfBeO81l/W6rKO4mZ2jLWmhfyMPhhia8tov+1
X-Gm-Gg: AZFdTZe1UJJ0FkD8iyMx1K3zzRgyDOg1xzGYLsdDijHaxVmdGPexBCbB4nh5sC4jyHn
	mbQso3KiFQXqUQqjy2oL0fzSsZt/HKFCPt4Z7gwl4R0UfYzWEgEVQmyix1GPofZ8N8L5hJbHqi5
	Ixz2LY2ZK0QF1l1/ZV+kwq7gp08h9YWjGjC7F9Uc9R8SVc1pXiyznrXMJYU0WKq9WRZIHmrrf/7
	NMrFd3vZyMlLhrXjMJAZBdcAelYbM2T1xOoF05rK/vlpbXFSG7nF2BjUOAlKzq/XiN8TzGxUHIa
	PF4izIco4u4X24MkT/kZm70pGpHie4fF3USxobxow0vEinxYLY3YGsQm0M9zgu88u0LImMf/q4l
	bfWhvYz90/TvKf24fcuXIZXuir73KHsIsex7EgToFC8KKHjhkdHDKNdx+AUc/kgQhk06T6ix1rh
	3BPBDgrxccn0QNOni2ediI695Fag9tTtsPb0FRiHzQys/mBzytVfgDNbIf/cbTKpMmCYTsUv5Ak
	esaWIH2nnShnwhj8RJzx1C+4vU9i4DTfPAtzeICh0Fpfn70ATNgstgzJrEkxTbGfGw9fiLSPK8i
	wlca9PX8ubfLkwUQ9nQ9m37FbPtQKmlYuHHtPLciFMkLhfbXOd3IJEH24Sdv9RaT5zTUo1g=
X-Received: by 2002:a05:6102:1627:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d739390113mr11904683137.11.1795698622762;
        Thu, 26 Nov 2026 05:10:22 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d819sm22349000137.3.2026.11.26.05.10.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:10:22 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so4909880e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEV+dZK1VB8mZXKjQ7jsD8DVQeKTHIHGYBt64JL4HmUj3G9i5CAqMTsSRqMZHHtNKQAOcoWo57U4hd8GcTAAlBHmg==@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12500493e0c.8.1795698622003; Thu, 26 Nov 2026
 05:10:22 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-17-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-17-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
X-Gm-Features: Aa3M54rTYSp7n6mDEivRvXB3zz9tm8FUTty6In8Jlz7Pqa2lf3sYsYsJuOUeaRc
Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] arm64: dts: renesas: r8a779g0: Describe the PCIe
 AER interrupts
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

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controllers report Root Port AER notifications through SPI 454
> and SPI 461, respectively, separately from the integrated MSI receiver
> interrupts. Describe these interrupts with the "aer" name so the
> controller driver can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

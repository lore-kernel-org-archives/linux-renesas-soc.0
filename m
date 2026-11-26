Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699049;
	b=rALl0PR/SlAsfMVoaVmc/DY/u8DeJZCWHrc9ZuY9tGrwYbUjZ98oGKwZvXIYXXGNaG6E
	 /+VGD8yQUjqnHUZDepsYx4WjcSvphusjSN2erGmJZBcyooIbZKB/KQ5lj0pQGnkeNS2ah
	 bHzulLepynwI9EXc7Oqv4hH0UvUlZP0Hyh+Ui9mrwr0cU6Bhvb5yVCA525j02GdfUf1fx
	 5UMd8S6ou9JElHphhny2WQrIyOKPoQMB2F4FwgyIDSWhL+dO6iJ+SU7xH2Wm5vOhdngw8
	 4NSH3sQl22DRQNNI+UNFGEmjvMTwL8lUU3P/NnX9Z75nNDksgdAq078C9LsrM7plH1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699049;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
	b=ae0xTk9evOFunxPuBaioDQ0L7dU038vrB5qnsTeSDGTPyT1W/MCAXwFJeGr2PpQSXd/7
	 9p86TjMlv+jLG7V/sJnfDGbncdEqnhk9zwxJAHatpUI9apppEzgITydq9DCPhIF0ueJZc
	 y/Dpz+GOuGbgUR8Atghlxo5QKEUfiilq+a/0tZEwqMaTQJaW+BLEC0c3tW82sfBhl1sUm
	 BjA8zYHWwX2pFHbUIGRJF+LsKLNAzbgNhXP2u9srcubRz2FpZfF6eY6UtimfSYlnTXJwm
	 7YtTsAt0kOp09sKoxdxLtDaNi6Q+Tg7t+zhdYl4ElDgz2CxxvOhFVj3jjFKGgWrpb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0668606A31C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0668606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso4874278a91.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699048; x=1796303848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
        b=GFKjEdcrPvw5cME+EX7BdzdZv9vN+EH750+sTqkkU2N29GQvrzRPhMb7wosvJgtr4i
         hKsV4jitX2H8zTU9j83JSzgv+UR+xiw96sIm71HMYyK56Lzq/wMdrvnsvA/QX+T+dvHD
         ljL5LFNS6J7zo5wylj15XhnQt8wgr+YnkZZajyXxrJOPQz7ymMvOKCrxtdIDpDyCnHGZ
         E2uh7Dd3xSpnf3c0srZtDJYuHH537pfpyWrt8yGqf4Av4dEKcl2vKvBcLHpk4GqFW2HM
         Z+PQZKTvnwUMY/ZfyMmmAC0LMFtCdinLSHXx4jsXavdqiVvzI73yEwSUADx/AN0HUp94
         VgLA==
X-Forwarded-Encrypted: i=1; AL+hErGrnk4xYrsUDZOHScq1H1xqH8mjNwMTff62Lz5ZKDAkS0XSe+3EeeOwLVHKNPSzZvWsIYv6ww5ZJPcSADEiKs54Bg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cY4KyfECdnqwCc5GXWTeSgj5QVacG/jw6COtrrObi0LEsyEmx
	OBprDAvvY2EgXLkLEOf+JM2iaTesEIDKhtgtMphS1zN4UT603i/eODUdOYmyJGDz
X-Gm-Gg: AZFdTZcXWDt690rQ4USpcwkdeAv2FrKKQbioGP7LxApnIxX2NBi48D1FaT2TI1tA3Oi
	HzuCNwpyXgO/jcH1GGAcB00Ctqa0j1bHC+SmAmpgbk5RZ/UjbwFCYlYuRCBufO6BEVXa7ygMljY
	zjhvNzDRSAD73m4w2pnE8OjLm3MfN7WnDAJw+pGoC5fylnpCjDWggEjr43G+vLM8X9xnk9wa5wX
	D/+GZfsdLxkVyijFJpgtdjiwtxiqXy5sCttDAFoBn58bflJ1xrdr9LQdfL0G/duAZGWyD2GAIG0
	3wlnkNEJLzCkEeadPYL3LIacoDqEQ/TDjEFEZq7EVPQnOMB9rOq2qtjtmPEbXzjiLo/IpzTTbGo
	34Bcgl8OF5oKV79TUxbjGWTMcoNNEESumzy98yITiwKyCoUsP8PJ+DRlgQ1pWZ4cEvv3TTtlEaA
	olKRpEvRH3yn2RB59xqDE77Z58BRhSy/lvcnZj1GhSZoObuO4qWuZAxJlamoM/FfzAm33C79gju
	Ho8tCEBBVLqEHkkLGkRvf++6/GhWSL3/453I6t9OA9ETZzi8jeHsYbGD/xxsx2blYUIgAt1nETM
	PRH99an8gKPEle82l0oiG5LNMjSh3aH7AYKSw2KfmztO0CnswbHh79w/O6yOqsG2V6Y=
X-Received: by 2002:a17:90b:5888:b0:3b5:a3:442a with SMTP id 98e67ed59e1d1-3b500a34677mr4685778a91.40.1795699047873;
        Thu, 26 Nov 2026 05:17:27 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm22934037a91.9.2026.11.26.05.17.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:17:27 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso4368944a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF7i5mgtxfTmD8LFAhYkPqUYDJ2Fd4DvY3t3yHE87D4wnUUGU/4cPx0NfyGWhkZYv7J/GR2MEh5ytjOQtoz0BUj1g==@vger.kernel.org
X-Received: by 2002:a05:6122:8b87:b0:5ee:27c9:ebec with SMTP id
 71dfb90a1353d-5ee8ae89d30mr10164180e0c.6.1795698590878; Thu, 26 Nov 2026
 05:09:50 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-16-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-16-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:09:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
X-Gm-Features: Aa3M54oGF1y6BfpWLxe4xGuZFgd7nGmTk63s0g99O3cHf_svXMj9Q2unpIc8mY8
Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] arm64: dts: renesas: r8a779f0: Describe the PCIe
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
> The PCIe controllers report Root Port AER notifications through
> intreq_pci0_lperr (SPI 421) and intreq_pci1_lperr (SPI 428),
> respectively, separately from the integrated MSI receiver interrupts.
> Describe these interrupts with the "aer" name so the controller driver
> can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
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

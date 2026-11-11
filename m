Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395383;
	b=KDNAdtbNW11GubBjeqS+iW1vbsHENxfm8rpLLXTQsePywd8X5r7L3qzeeQ6nRM0RLTqo
	 mk6CJGs+UakDdu79L4d37hzk60ek2/P+GFw2NmoWfZ2UKR+uaWri0y/yrjCDL0VY6eEHJ
	 9hLbiFnU0edfF1sj94FJvgP9Vu/X/Os2C4QJabgMnRCsU4a/W70n2egKe9JC3HE6BtOYF
	 OdgSPPyFf3U48NpwJAmDf1ZkdZiitygPfZyizdVOGFQUwrdeyCJeTlLV2FOxD1FuPbKJh
	 9MT3GAOKl742ZKxSXlVsCTmXgcdtDgF/fbLFN7zFoaeucwDJNCnlP3X8kyqB8gF/2wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
	b=kEdibbviYluyhZYhVHtwMbxtJYPDY4LGOve5rsfZE36wX1EXhZS5PVml/z1hZaIYzkqe
	 U6yFWAgKMMU4dNLaswOcOskMWfvXT5UFruVxDqAJL/jFDP9A5C7ZrBwFq2Iu9wb+Lcx9a
	 J2nK5QNCzz5qgjQQLCw+N9p1BjID7dvlYvS5TZyJ8q43hTuF5Y1+MHpPbTHh+c9TX9p7J
	 H953VyUUzMrObXMLiqlODS9Axs2kc1+G6eDyBnV64FRVymclGLDAT5QtvRUclXV9hcvOs
	 Yz6RI9d9IIG+nf+i3d0qnROiu75Vwy0/bQkGi3Msj0r1fxXhOiO7znFkSnJjynzwpMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F05606A331
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F05606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso758374241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395382; x=1795000182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
        b=LIjL+GFppA3x+aJ/aMHwtg11VS9MPVyUcqvgGreu9BpufK8SWpQbdpFe/JQXqbKfYm
         vgghAce9gwP/zeK6nOlv44LvAicoluo1yFKyD3UovF9yNxXrxiHMIP+HnEJ4yfGI6idI
         rPA8ZOA1eQIq2jVCWrKNmdqQ69jTpM3C/EXxt72ECU6iZeIwzQ+EZC45Xx9qQqU88QID
         rIPfaWvpcriQ6p4Cb0Oi4D4CcPsd+IXEQQbpk9hFjNBNF3K0mw1b42WtS0NXvSnKmD4i
         hz/ocPr7tlNSPNErL9+8gyVyxkgxvLNlirbePRaCNJuIEXkzmxDvCe8eR7+1n4GYD5i/
         JiXw==
X-Forwarded-Encrypted: i=1; AL+hErFUfRs0ntR+wY2zusOP6Iy/jW6tDcsinGkAjQXXp/tG6OgZydHlpWzIGfZEwDH97cbkJhyMM7we0x424O/gbT9ctA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EUligTbHn+EyQkwerz4BsARovIkJOzBFbFKWworpUyi+nHqZt
	rZDdr9dq1OWPJplWyrIPjfGTOH9JMia43YwgqHkjBw4f5qPQ28pcrhFPK05CxHFOeS8=
X-Gm-Gg: AYBFou3GRN7b59PqDunZE8AAyj+hlGEo/VVXBjHnSXL+9MjEq261NdjpJaJA03b5y2U
	/egbFgCshLm/Ov8Yec6bZQaEyiqGMegPvQJ2MUwzC9q8hxgeB8vmGE8gHxV59OpzxJdXo33w6uY
	Qx+zm8q1q1LMPXLfmqzgyKssnIi5F5Z6VsiJc3GQXxuoBZG7tHRLrsKe15U+aYtClheh2/zLuVj
	0JFJTtO0GnTJlgYLkmrQuilZTTTvf8bDQ/CJNaXG8pAaZz+ImWddf3gvWX3nsGmXH76xcxLF6yl
	b+qgdQ2ZpCk5FGLXOefC1MxWaMt4vP66SyorcdNefh+alespZP+XPpfnw4otveRDmH8w9P6e7DT
	XJ6pRL3/HT+VuzKhqFC7uNKIVpV6VgB8giOpevzkktCl2hPLw7O31CLxBE/tGp16enZZGNcmgsg
	1Ge0dHjoflXCwUdNjnCJToTDp0exPPgu6gB2gmKWYoMQVttJClbwyiFnvZm7VLvhxt7hFvpqVNn
	bX/VXiH01m5DaUPXZBt++h23AxcC5cY2XqM+qPYo0ZVikgRNR0LPrNcN+Q/uzEhZpM+ZzhOowTi
	QKUzVViWULno3NBE4NJzThMPJ3PEqiE2rFUfCAhsgF5EuLvycxtRZvnD6e8gBzZR/QM=
X-Received: by 2002:a05:6102:3e89:b0:7cc:2cef:b341 with SMTP id ada2fe7eead31-7d4ee1e4fc0mr439545137.4.1794395382205;
        Wed, 11 Nov 2026 03:09:42 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm3589867241.4.2026.11.11.03.09.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:09:36 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc91ddf447so1207780137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvGOTcUPshuFUNjzS0ihtLPZVYmmnlo9LNQcS8eYCZD1zAD5VbLGk6ZU6OPjJ86CKoo9bkOzkYIE5PAyO7eBCJxg==@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d4fb291ba2mr478980137.14.1794395373576; Wed, 11 Nov 2026
 03:09:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-1-1b2072e8c37e@ideasonboard.com>
 <20261110-steady-kangaroo-of-mastery-5fcd7f@quoll> <179438844820.272237.18262716067322018404@neptunite.rasen.tech>
 <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
In-Reply-To: <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Nov 2026 12:09:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
X-Gm-Features: AclHuK-p812fgpXzcAZTo074hP5s29t5onlgPposQZBLZQWezlnyhodp5CVCArI
Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGDn_VIO_DP_{TX,OTHER}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 10:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 11/11/2026 10:14, Paul Elder wrote:
> > Quoting Krzysztof Kozlowski (2026-11-10 18:30:50)
> >> On Mon, Nov 09, 2026 at 10:34:22PM +0900, Paul Elder wrote:
> >>> Add the CPG_SGDn_VIO_DP_TX and CPG_SGDn_VIO_DP_OTHER clocks that are
> >>> used by FCPV, VSP, VCON, and DPTX cores.
> >>>
> >>> It should be noted that there is likely a discrepancy regarding the
> >>> clocks. In practice it ought not to be an issue as all the clocks der=
ive
> >>> from the same SGD1_VIO_MAIN clock and none of them are programmable o=
r
> >>> gateable.
> >>>
> >>> According to the datasheet, the FCPV[BID] and VSPD cores use
> >>> SGD*_VIO_DP_TX=CF=86 while the VSP[BI] cores use SGD*_VIO_DP_OTHER=CF=
=86.
> >>> However, educated guessing suggests that IP cores in the same pipelin=
e
> >>> should be using the same clocks:
> >>> - FCPV[BI] -> VSP[BI]:                  SGD*_VIO_DP_OTHER=CF=86
> >>> - FCPVD -> VSPD -> VCON -> DPTX:        SGD*_VIO_DP_TX=CF=86
> >>>
> >>> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>> - Add all the clocks
> >>> - remove DNI
> >>
> >> What is DNI?
> >
> > Do not integrate. Most of the patches here were DNI in previous version=
s
> > because they depended on a lot of downstream things, but now those depe=
ndencies
> > are in the process of upstreaming so these can graduate from DNI status=
.
>
> Upstream clock indices ABI does not depend on downstream at all, so
> seeing this unmergeable is just confusing.

In case of the clock indices, "work in progress" would be a better
wording than "downstream": multiple patch series are adding indices
in parallel, so some of them may need to be renumbered. Just like when
adding syscalls.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

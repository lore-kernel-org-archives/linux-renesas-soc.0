Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC4530DFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175806; cv=none; b=fpEFaAHNAFL4142yr2uAeY/jAuMfSyS2a8AOPmkUVMTGk3UP7Xm/FiPdWawmQkGZtABCYNs1lY3ysnTzi00qUKhNgRJFIvk2ZfqA859y+qRiU3nZaRSYIeutiEXYGnSPIE4sQJlsqoJ8MIpN4mt8niPnfcnlw0p/Z21F3yLI584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175806; c=relaxed/simple;
	bh=R0Hl1uM+B2TCFyzAh2mRelpWA1TgmI+2NQ2VkDXBKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBr3NP12y+vkg/lrIbDL/MG/Iw/48pygBbesnaVoc8+7oN6y8iPAUS9K/X/H5eqMRSJ7+cSFURdcV7s0fk7N4Ut8pOk6RF0Hn8wA2bm3XQMn7mS/U5SHs0XPgIQWGjgHqOnLbpMJM9cwkOPLk2NxPqLcdWqpcpNqNf9r58YGhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad9so738373fac.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175799; x=1790780599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4gaNTKxdC+sW3aviG7p02o1OWtFZhqrn2Ys43SAJgs=;
        b=vwtvZ0pq2eNAXqWRFPFyXjpNdlqth+eUA3MyrtF84SmHyyaRPaqVhQmSjxrFArZK8v
         wxHEh0CHayhrZydDkerxdgdsyOA2TbpTF6pnQtQOpGs1KYmUuCFqrHxx0noXonbXXMw0
         1DMvmvoGnkmLzeHYsTL3HDvglzf2O3bLHDS5cdqEZs6bMZBs1tYFkKkYIQYN6te0eF+H
         u8xNn5HDv0M3+Q42983K8mj+c1uYE9fu4dOXkJbTicMe5g08vtK7ndas3T6BP3AK2y46
         +EDVOrGfsvAFZW7np0mXnCPXb1MjXMKOwm/2Wrff59egYnAeXX65d5QNhfzzNRiBG5xX
         Xjqw==
X-Forwarded-Encrypted: i=1; AKwUvBz4t0YDZ8CLWgX5Z4bLxCS4c0iDHo0lxoHM3I3befHByfT3/am7PLIGWSLTl9irI3KiPMkoVnevbeVS6MhoMM6xjg==@vger.kernel.org
X-Gm-Message-State: AFuF++mm2dxnIL2SMJIVGUmRPPF4I/hDT5XwxIoFcezh+DZlnzV4LFJw
	UU8WHxPXmPAqP5wXcozxBRCVxdhvpWdpB1jSQ6t4pGiRnoVfCahihcD6ROVtlsHHyhM=
X-Gm-Gg: AYBFou3tpG3pq6eEb0+0JrcHxlnUvOnhPo5y6Y0neWscUeTsvmrx0mvTC/OeBVkdoL9
	4yT/hWFX9VUaEdVPsfiz7BuSwdtd6fc6pbvUnLht6RKItoYBI0YkEV68DYF5FPRJG6miyisGwj4
	33ggD+Urx7eAEXXisSxLoDWEcvh7PL89gqj1nczl6rL/3j/1ynkxLwR+aRYM8mcGfH+jH6cP+F5
	0RYxdxeWyjd6v4yj4WGV6cm9VjttFti8PaIMVpZpX6juSI9qE40+Sk5EMN7uAaCRTp7UcOPO3L5
	piVGRfSAmyOjRFju/kEb22EiieTpYzZW0YKLsJyu1zzRyBROSyZeqG8lXnUDMOuyAw/DsfnENf9
	xi1+K2EsZ1QVTqv+PjnRNUgG9dgjzRDRP1kwzDqd+po5WL896oZouVonYcBzFHK662Jdbvrn4iD
	aSMypv92nJ6fbCeIG2gTMCLry+PVoA2KgC6aqLuBN1oDHwXEcDNcOGGJApUgrDyx+v2Xl7cu3i1
	Vnmvkk4EIftTHUx+FI9M5fqAgtiZZCUrJIQ
X-Received: by 2002:a05:6870:d307:b0:48f:e21e:1e70 with SMTP id 586e51a60fabf-4908b3e69d9mr2868024fac.51.1790175798818;
        Wed, 23 Sep 2026 08:03:18 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e54f277sm1831740fac.7.2026.09.23.08.03.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:03:18 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so714166fac.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:03:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/Z1Xns5a4BGkFQ7Z2RZUsFKktEnSS1alQ6bOHYi8UzycNM7ISfHuXQfaaHyA46OdFryO6zkZ40pCUbSSHNETnAQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id
 ada2fe7eead31-7ac1e25c9a0mr2449263137.32.1790175380384; Wed, 23 Sep 2026
 07:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:56:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
X-Gm-Features: AclHuK_46aJgUmbOx6pmISWhWZ74QNKHCsrv6CnnvbaLCpF8u6RT7TH__uXbV0M
Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:57, Josua Mayer <josua@solid-run.com> wrote:
> The SolidRun HummingBoard IIoT features a DSI connector supporting
> touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
> SoMs.
>
> Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.
>
> Add the addon in Makefile for all supported SoMs SoC targets.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

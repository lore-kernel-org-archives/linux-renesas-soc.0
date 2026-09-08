Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860A156C64A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884556; cv=pass; b=poPDlNAKGjfiPRhu8tkK926XnkucQUw5jwR8y4Te6DHPEaMF1m+pTJDW64DG7OVn0exNalsIpt9WSeGu1h4geq6Eo5eU8HZnFHTv1G9pHh06YGyM/hGm0rTogeR+X4DzUgL1zykUerfqIU16oII+GrwRq61FZsTcVoWSLOudcvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884556; c=relaxed/simple;
	bh=gx0WNzHrzpR5Vg5y5KJZ32oxwshPQgn8Fi9efTzEQjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxVGjbEnR6toxEadmd4mq3bxkvneAJ6TnSAfUI8mvneEWnwlvoPnzir5dWRlx8wxpUlFv3ySxA3tdA6LJw1/1n1pdY7vgZanUEA5cCWJPdPl/uLST8pD0QoMdEEmENZ1rHDflrlBkVMT2NTS53nCOrYyXNpWEeA9dOOXL7dxMEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHI7JKr2; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHI7JKr2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e257a23aso3339022f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 09:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788884552; cv=none;
        d=google.com; s=arc-20260327;
        b=qoJ//ZlSCrTQfHYt3FNGdvCjoRpf0Tau8OBtwoH3n+0FzbjWZ2BXnfosSHOKstUKdd
         stjVdYswQS5Vwx/AXGlBwMYqj8O3+3a2cE/3iTNKgJ1TNgmTTXTBl1RzJwuxTwiP2LKg
         5XsxDR+iDIwhyURimkFuJ1xfAGVYJfbNkCBKW1fKq9PuDcU+ryyAPQ3663OvuFnaKQqn
         Qrgc7tWfgouiODL3HPBwFe+WKNIkkBqsc/voOxmOnTTMmzaTT1PA0HyO0sXg5Bd9o5l4
         sHMy5SYQkWGvAdt+3ieu90/L4kpvFYOE50G8Qop/YRCGfbY9kTvK0PalyWau4cujas1d
         +6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        fh=7GJmc7EscTK50jawfdscsR1fgneo5Xf5tJKahS/1CIY=;
        b=NpqN1pSEGV6qTg8Rku/Ogx/v30MtKltxWehPlueKj0OBzQ2+gWgyjBEcOdO9sJKJtu
         Ij67kQtwB1ogOcOUqDEWAg8nxDYrMs0hOzR4seMDEGZZ76mCWiBOobm0hwqn97MzKUKz
         zzsAMgYh1NmMTcmF4dBTWKomTQDigfslNK1qhZsa8lEMMZPHS2X4cluf/JBm5GD6cLtp
         TlvAf4SHNsD1Ww/LqXxSZKWpCFik6uJktQOo4Or7RAfTO6E6tIXyLjVcuat8AUYRtvAG
         YLlcscL3rSQuFQ5tdEWlFVyYvKyfIwe4kG4DH54tgt4s7AO2MZDVGrdHR+uqUB1zvzUj
         GUXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884552; x=1789489352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=MHI7JKr2kkr24YW4snLpJdEML8QbgbEuKlTVoMWeXvxapQb9bE9iEJ/apSQfsEBCyF
         6UK7QNkxSB/f9xiBqGLkw/iBAFfKmaoStMFU0SS5vDwnJAGG+tC7GH189zop7UdBzH8w
         nwK+VulVgJKrc1YU+MG+M392P5la+71HfwYsPHAQAtL6Wmj11OiTlSRr3/2FVb7gcRtK
         kzeWmmZTOwgHWcLQ2wBGrFe/9jhFTHjnktsABOgWj2M/hW1C+S4I+XMRSJOVRPGTC81W
         1m9LjXgjk7Udg7NCQtPn+rsj5TDhUg6pzer5U/kGbQZXLXNO6XY0wDlRDF54Tgi9padj
         LwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884552; x=1789489352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jekOF2OhfE9K8vBMYq9LG6isiwXmYjORyhfyHiOqLIA=;
        b=cjfCOulEhH7I5EIMy2o/kUkQjf4ZHOTjLjUTKl9OGLVt2Zo5zh70AW2EQVE3/Fw8SY
         vO/Ww0PU9/wMTR0IDgLUGAsaXD5RDLzjwjIWqFFvJx8pin+FdKHpPEsXITRPhrQt3ELr
         iFiOZ/yWtzHHHjfupOBcTYaBbF3D4VD1TSoFuQctYzOktTdnx2/XTG2dbIH3qRhK4aVy
         Tdrm2QY5GGKqCYcEv2MODvT8fGWVd6wb0DZ+nMaaXjtRZXzhXEcSfaxW1raEBPriIRn7
         NbtPmzLVPedVOEIVdF4WdRj5zmH2qM8oH8bdU1KJ8JgTGWgvS9YXHxzYLOdzQwUN1P5W
         oO9g==
X-Forwarded-Encrypted: i=1; AKwUvBzLPLmqQyFwPFSroojyFyEpAFm8gi/XZziNR9BLd5HMndvthtjpFDXZ7bOgdUOIlFHlp3mFOZuuNAnRf8lGJQbzWw==@vger.kernel.org
X-Gm-Message-State: AFuF++m/6ZiSWc/T+JuCuGoB/AfyYXO4Z3B6blHvK9+D7d2UIokz+sek
	Swy+KOZGDbho5LIze1FPjHAIiF3xBYLB8llNKfZxkXl4dZ5XO4Eg2eCxKObPO+MkjSAMjq5mDyk
	9K7L89C0APrfEIZ6FUqQLyXhwr/R7yM4=
X-Gm-Gg: AYBFou3uTQju0xEsDeANc7iJ4WeeY4sd2k0rn/k9zJsc32qdlm83rBCaTU+ufwcyvFz
	m7EJjDb1q10C8DJxjXi7J2fjICBvYVaDfniDeTyf0T4++8KcZQZuRpVzdIWT3FUh51rFacHGRK+
	CGsWP7bB6yA1tWlyytDTIpw9LRAJpWtAQC35MzzOvhI2gIJoEXqZO1W37T+NMsSTkJWV0antXde
	vOOP8zEdk64o1OKV6igB8TJW7bREcb1fRYptqSCUqtWOMZLC/xC9slUs0az0itXKU8EMYPev6lX
	Hzjjd4HAwM81GDBKiZQFIfQX91eBxQLpITPdEhllAxMxFMIZnRWBeXLQcQVph8awalStL++S210
	edeoclzPrDVghhgIeMDNqesDXgy1bLQ==
X-Received: by 2002:a05:6000:29c9:b0:485:8ecc:9415 with SMTP id
 ffacd0b85a97d-4858ecc96bfmr18626346f8f.48.1788884552482; Tue, 08 Sep 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
In-Reply-To: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:22:04 +0100
X-Gm-Features: AcwNN1U9H3bV0zPtcgBr5_fY5_Ex_KcZm0AWkc_KXas88ZieEy0_hzjnmDi9vSA
Message-ID: <CA+V-a8uSR2jgpYqeUxteqhSD-FuxKBT_o2519y1z35cg+3XOig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Sep 8, 2026 at 1:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> > in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> > multi-function block that integrates several system-level features beyo=
nd
> > clock and reset control, including clock monitoring, write protection,
> > and peripheral configuration registers.
> >
> > For the other IP blocks to be configured a syscon support is provided i=
n
> > the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> > registers via a regmap interface.
>
> > Lad Prabhakar (7):
> >   clk: renesas: r9a09g077: Register SYSC regmap
>
> Thanks, will queue in renesas-clk for v7.4.
>
> >   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
> >   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
>
> Thanks, will queue both in renesas-devel for v7.4.
>
Thank you for picking it up.

> >   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
> >     support
>
> This is now in watchdog-next.
>
> >   watchdog: rzv2h: Add syscon support for WDTDCR
> >   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
> >   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> These two have a hard dependency on the first five patches, so they
> are postponed.
>
Agreed, once I sort out the series [0] maybe we can take all the WDT
driver changes via renesas-soc due to its hard dependancy.

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/

Cheers,
Prabhakar

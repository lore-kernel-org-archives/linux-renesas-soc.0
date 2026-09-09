Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29C53446B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967268; cv=none; b=PvuZJTao769NN/u6dU06L4dFWYd0B13PJe8yn5j8CBpEyoc1jtFXI48cSFz3TjexYc9U3XVh+oCNpu3nWZ3nLOS/lL09UAz42gatmt4TOJiLJNKf4q/SirPsQhwnTXhsoe76P/0BBMXH8wS6KGocHpvSl2Y30RwjD7SH/ya08Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967268; c=relaxed/simple;
	bh=XkIfu4GFpqkkfkfU2ELXJLd/gzXud8DjECfS0dWQbGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNMUsgnkI1Jjt5zM/qlEbvv/Ij4xE7R9UhPJ6yZuirCCHyfBJND/bxfDwSs9vTPGLNNZ9M35OLgb876xHet65W2Pq3gmjwZp6+jE7G9H0Fv/sIvYSRzLJhHfBkkwwyXznuV8EShy8+zAJ7isxkVzusVN6HqP50H9/0kWXyhQ94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso5434553e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967266; x=1789572066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xIh1wPKDMe5t+fT3IE0obOGyRNurvI4tDRD2p56gTg=;
        b=PYz3C815InuGU9k7dU2wG3yNcb79yJdgCgs0N4UQBhsze/pmYEMODxI6Et4xcJbuoP
         zg5jwYoBNBkkR1ZnmBM24Xzwbui7JeA5SXNSwJaJYLXXSsTgalCTOo+rwszxxIah4ErS
         UT8tIuAxKPYY8iHw9u6MqM6w65QLDFLblbO6SzMCPiNsVxVeYWCnDhuJQuqZBMgJ7yMV
         Szt0TfKhcRs9RzWefrhxsXr3okTlPumxtq3d59642cDWh+/02kZtZn9L/iXsdnHcLRck
         RiCKMjSfqycawUsjdH4Yyf5FMyhCZNFmRsz1ZkjC1DRnIQKoO9e7jNnPUX57oZHez4wL
         /oTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYRkFTBdguBaYqMaAUdhoLgm0CC6ootToPm9MZdN6VHM27mshVR/R33vYI5bknrPPlzWfuixB5sRD6kGviL4o03A==@vger.kernel.org
X-Gm-Message-State: AFuF++nLNMzWdOZ3pVkGTGuthSrws3IRT+ds4IGCx0xzgnEDylupPgMj
	9SA2iANn3w6gIGP8Buy/cNfrAJ6PDGtQfGenhAnrwvnhS66MmsEMYpnM055zqJ5eQfc=
X-Gm-Gg: AYBFou0K1Z/yytwrSnMCrmksK6nXu+VCWDbS2N/G+PtJgBemeXDxBPUIB9/bP+hlH/6
	KOeLYomLvk//27AZ8J00KvL/UTdLquzEsDZsHLDPr9j6Cv9WTZqmd6Exinv4ArzvTjo90ygivSX
	SOpDhZyNMiupBffThoyHO4jqqstEARXmcwzDApapGZLHGmfnWMnSqVVHvY57vbosD/GIVx0SDlL
	T5DUxyRLVrZErNUbWlXJp2d5lQ3Gu/wkU1QkBybrPye/fyJRP00Tu6nzyFMV6Cur6CnZuWgGQye
	vV2bSKgEUfEmFSeyEoOHU2WzXQfo/eABXDpbMedYeOweWBXqlbtFaHmpNmCQDrKB15MZuLTMeNp
	mJqJFbLI/Qj6BoHBPOWFI4fyVlAmvz0oOFfBea2X/jyHvYr2rb+Y7Cak1Bd8eZram1j9rv+F8bl
	/pMSs0Btkd3KxFuUiqw94cve7te1hkGXHVlzV9MTLyqT8NXrHyD6gLQTX6dFRg8YHdSCkaaYeDP
	6mIHEsrYkfGLbE4HAOPYQkyq9sId4Nlu2WH
X-Received: by 2002:ac5:c751:0:b0:5c5:924a:4616 with SMTP id 71dfb90a1353d-5c7dcc977f3mr9633497e0c.0.1788967265606;
        Wed, 09 Sep 2026 08:21:05 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm12825470e0c.6.2026.09.09.08.21.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:21:05 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78a338fe106so4668746137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:21:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwj/08FR2IefssyJy/WtkOI4cYOONfv7y87dGkmEkQL9k5fOZUK7OJAxwWskRUDOJHfNV0ZRw2sIzn7Km6zDIYHbg==@vger.kernel.org
X-Received: by 2002:a05:6102:8308:b0:76b:2548:560a with SMTP id
 ada2fe7eead31-78a2efe5c6fmr8198191137.16.1788967264493; Wed, 09 Sep 2026
 08:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org> <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
 <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
In-Reply-To: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:20:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
X-Gm-Features: AcwNN1X2mn0ov-erdE-79oChYQokKwSLC2Xb3xUhMRJG7PmcUAF6Kj0jO0aTaU0
Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 9 Sept 2026 at 17:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:
> > On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wro=
te:
> >> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >>>> +&pfc {
> >>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >>>
> >>> Node name should be "msiof0".
> >>
> >> Do we also have to fix up
> >> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
> >>
> >> "
> >>    755         msiof1_pins: sound {
> >>                             ^^^^^
> >> "
> >> ?
> >
> > Might be a good idea, to increase consistency.
>
> Submitted as
>
> [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name
> with label

Thanks!

> >> But I wonder, shouldn't the DTOs contain unique pinmux node names, whi=
ch
> >> cannot accidentally overlap with the base DT or other DTO node names ?
> >
> > In general, the answer is yes.
> > In this case it is about pin control subnodes. If the base DTS already
> > uses msiof0, its original user needs to be disabled by the overlay
> > anyway.
>
> The original DTS does not use MSIOF0 .
>
> I think the proper solution here would be DT connector ?

Keeping an eye on Herv=C3=A9's work...

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

Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197D45D5EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2026 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931379; cv=none; b=iacaErmudjRhPDlOUifoCKJuL1aAV4KZYS1O1kcs9SR/SOItUPTRx9ZVWndP2ACcheCEhb/A9RuqD3BPbHUIxKGVX2ENtDWzJXjIoae0UEqSyjGVOuufc9RVkMhSCp/xcp0YIb2BWt3GLGoAmlpP/d/j6x9j/7MJzZxd5DQdGUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931379; c=relaxed/simple;
	bh=mWDkhCDQt28Rzz6I2tZE/YSz/t9DgfeaNNfvuTOIjvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acKAFTWC2Nbjg0eu4sVjUHAfek4zLdHx/INoD1uS4rXGvm/EvHtW9L3ccDi0WoboS5Equ3AiaKiNSLu+5mZxQA8T+iprneqQNAWvlWMnW5VSe2WvqpMoVkakpe2+dqyb/8roQ9MYe4G9l9557U0xR9QvaiDmMdx26Qz4AGPTSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso524173e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 05:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931375; x=1786536175;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cmx7yQpz7FXmZJPiqLpJPoIkgxVuzO0p+i85ObW18Pk=;
        b=IPYVX/EDgWyJJZhksfEXQvrCKAIkGQoQ2im2aaC/emlqKIEc7wNhTPjsQJQIwNKsnu
         EBc8nrfeyXH7cU0v2xy2QlheZN4vYVCYTw9i/obAllJNF+KvkeX7pWUJGBcvDWyiHLXf
         t/K7lpZAH1apiJBIDs8PCuBFKup+qnzperDNGuRqPHX2QwLP4DWyLZ9bVzJswcwvBCDv
         6Cz2eYY2FcHmZ1abzMhd7JTSpipNAdGCrjsnRNxpZBMOCGLbJPQPXSWAnDhYPJOTMVQ4
         shRVz3v/bod+d/0L1eRi+7aKJQ9lJYChh/Jkb63bg6aNT1pjJDgApQyiXiiK/NpRU/26
         m6rA==
X-Forwarded-Encrypted: i=1; AHgh+RoMO6OLb7Yyw0OA90qAss0bjooF9CsAEoDnNWFvSN78xHH0Jf0fK+/ktkr4hIvIXWCrc9RkZ6+TUFegMYSpfLNWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlArOY3LhKqub+XJR79LA3H+VZ4tYyGYaWMUE6+LTUpKvIDXPp
	AuCVz+2VvZyx+2CCoHhyXTd/1H4ktrG0u0wxrOC3vv1Mp2od3JjRqG3xkf0p6jzi
X-Gm-Gg: AR+sD13qo0fRtFg3TVcVFAlpi/oWX1xuZLWlCs3kwtGHmPUW+L7hXYfLsNptIfY9Bml
	ND8lnLI+/XBoS4buFr/WkhjWUtcr/HOIkixVEEuwc1/lKdU20LeWghe5PL3S6FO3LxHjzpBOUTI
	CVUZaC4r7sIrbb0ef4S6i4DRfOl8qXrTk/aFqKT4VPNy18OHBjbvTNTc0NGddOvhnhJbKqZIgX4
	lLPirUdLFlm12czwtVH2m1X9Su5d81TGnpQarkgcjEmgTwY5TBbdg5JNjoxTOrfM6kC7zOEzxRI
	uZRsrazuCNkAb4AT6JTWHcqMJ/1J4TAKQIXtqXUrSmpxT22eaDVdIufPt6jwQ+5Y9nH4wm7Zctc
	2/F3lwSHefXvGIjCdRVWhVE7SgLHAlO8IzlnTX5mqKK2FGeNEB7Li7ebpWUL9uKAC7HAbAfd43S
	RyeaxcVDvVgLJ53W2QqmHdo+y/6JkY6p4fNgbqfQ7e2SRGMhljFIKN+T+Zi1UiEv3BB5puQyiRT
	bZtMo+Fs0SCpemXh/qiaKx8GGW/UA==
X-Received: by 2002:a05:6122:3d0e:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c3d91c0a46mr828961e0c.7.1785931374465;
        Wed, 05 Aug 2026 05:02:54 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d050c2c9sm1535090e0c.1.2026.08.05.05.02.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 05:02:54 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c3a1d005c5so478459e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 05:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3sHY32pTOyF0dd39yxv3Ru70eAisR6eqH9z8cBaZ+jqOuCmtMHRMSXWProly6DoAyEvyDgjKBkLlBjz/ebUWDIw==@vger.kernel.org
X-Received: by 2002:a05:6122:289c:b0:5bd:fc23:c9d1 with SMTP id
 71dfb90a1353d-5c3d9162104mr906798e0c.6.1785931373330; Wed, 05 Aug 2026
 05:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org> <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org> <anMkwfGAW5fBSAEf@tom-desktop>
In-Reply-To: <anMkwfGAW5fBSAEf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 14:02:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
X-Gm-Features: AUfX_mzB7HlYXBn_cNKB7rJbOxNdM-zSKxAmP2nWd-xohS9mCBFdbwcKjfIe5vk
Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 5 Aug 2026 at 13:56, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Aug 04, 2026 at 08:20:29AM +0200, Krzysztof Kozlowski wrote:
> > On 03/08/2026 19:19, Tommaso Merciai wrote:
> > > Hi Krzysztof,
> > > Thanks for your review.
> > >
> > > On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> > >> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > >>> r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> > >>> but the binding never declared it, so dtbs_check fails:
> > >>>
> > >>>   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> > >>>   are not allowed ('clock-frequency' was unexpected)
> > >>
> > >> Maybe the DTS is wrong, because property was rejected? Did you check
> > >> this? You cannot document ABI post-factum if it was rejected.
> > >>
> > >>
> > >>>
> > >>> clock-cells is fixed to 0, so only a single audio_clkout applies.
> > >>>
> > >>> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> > >>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > >>> ---
> > >>>  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> > >>>  1 file changed, 3 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> index d7fa16554698..6e2b2c93b4b7 100644
> > >>> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> @@ -42,6 +42,9 @@ properties:
> > >>>    "#clock-cells":
> > >>>      const: 0
> > >>>
> > >>> +  clock-frequency:
> > >>> +    description: for audio_clkout
> > >>
> > >> Incomplete, missing type/ref, constraints.
> > >
> > > renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> > > and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> > > property is already documented for R-Car in
> > > Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> >
> > But was the property rejected? I am repeating myself...
>
> Looking into this further, I found that you already asked to drop this
> property during the v5 review [1].
>
> Thanks for pointing it out.
>
> For context: the sound module contains an audio clock generator (ADG) which
> generates an output clock from the external audio clocks and outputs it in
> to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
>
> "clock-frequency" is array of the possible rates provided by
> AUDIO_CLKOUT to the codec master clock.
> Based on the playback rate it will request either 44.1kHz or 48kHz.
>
> I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
> AUDIO_CLKOUT output pin is not wired.
>
> But for boards that populates AUDIO_CLKOUT we need this property,
> Could you suggest how to model this properly?

Isn't this output the single clock output of the sound module's clock
provider (#clocks-cells = <0>)? Hence can't the consumer driver set
the clock rate?

If the consumer driver cannot set the clock rate, but depends on a
fixed clock rate, it can configure this in DT using assigned-clocks
and assigned-clock-rates, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

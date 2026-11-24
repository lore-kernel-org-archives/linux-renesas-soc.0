Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795508310;
	b=lR/5915ZyDuhqzQ1USu6a6vyxfCbvvyQLdZf8RTDGASibIw+fMnUULyfozy1TMUJU0I4
	 zstSkhJms+1oplfFQDbbZsIis5e6neIU2Uv2VP575STZe8OrkRqyvub6GYzdR9sVY7P4F
	 id3Qlp8+iuUxBN1DPcmMs1FrTlGNNEYmlsR4YARoHfHLinC7J+/dOOtq+4AJyaDw6zCeU
	 aNYiQ8hf0Vgfeh06tFECZ4x3Xful91pH2cpyWjvCjJNwdDBkjWNFrVkM9Mst4hI1sKuIz
	 if0qfoqPjEEE4jgCoQAEYA1obsDC6OBYIgjMB2l7lkzPHrhjAp3cX3S4tm3pNCvgQVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ClzsYNhGBIDno1QrHtcA7NKXp8FCTC3k0xH3/ql+Q44=;
	b=HVb+PZbW8OoFRrtdc4AlivYmeRLEAXhCdTJOECAEIJIspY66L5b2ss1YPE8rXGPnsNuw
	 MCqQF2ZrCVNQurS7VWxOHddf0XfXxZsCoqfNFQKEKTOlwCx1DmGOCevQo2s0sh75OaMcF
	 g1a+nfMaBxJ+Wd4REXBP3uVJ/AD7Q95H/ugnuJyufFmN9fraJ4WSHCnhlOeih4Is+Zfg9
	 312fc7FOGUjRyTBcf0JXv+lwojX/LADJJhaGs92RylChaDLQU4+zj3jDU2+R7yo+5nPeI
	 ac2N85bbO6wAqSk/jYCxyDfKjN+h/8vxYzLrgaw5HR7r5kjAPh5sEqrPBt0i657dqug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ll7ATE9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440EA606A32C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ll7ATE9C
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b503e2a87bso43747657b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 00:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795508309; cv=none;
        d=google.com; s=arc-20260327;
        b=OUlRhRbOfJ8tK+T2rG4c02iDD6m7WElkvLv4mM5+/PmVt6he0kxyfxRFdM5P12MOao
         opL5V3/XLhFS1xxJmlJkqdWy5wuo8O3bnoo4HfJrJ0HLT3JUT/PemhHLzdP3azLwYRFf
         a4bgQ5/YHXg3lbyjyoOL9wAGmCTPcV9bmqwyDrGAah+NDBtdNvRh01EWv4iN+SdS9Zf6
         0OVdW630B6ttegDB4i/kDUXVxbBvjoLSCqXnrH3/d9Sm65wjSm60Zys/uXjlGYPS2fM7
         F5YckCyqpZVq+5tQbrcSDRYPoZ2OZDBxeOipfuaVVohOOegW08/gpGeQBcUUj0LIUlRZ
         KP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ClzsYNhGBIDno1QrHtcA7NKXp8FCTC3k0xH3/ql+Q44=;
        fh=xtmffBylJO+QIxvzfsW7UUCgq6wjMq7IyyUt7NiCTZQ=;
        b=NSwgSRdWSN6l5MEjRvZEDdWtDMlkTPLb5V4gWkbSTcYk7+vM+NSukGyfx1DIZ4mBGm
         RhNut1Qpniyxv9/0dYfz9QkczCQzV23ISEKpUbRLway7Rj9yevgpxcobbMJXvpB6h/7L
         AXJe1dTb5lU2q2zW+w7Qhdzd94fOBKRVu4ml5L8xfALrrz7UCS6o++O0y9kM+nvWK71j
         4DwQS/qknU35nt5+nqJBdC+wwdP38mTsgSI5w4D1UZj85jHs+YBMcYoYsAZYBt/tsNCF
         zQC0bPvID8gy7Kgg/Unc0n4KBvO9/lLTifVLZmfzeeeqH2OpG694VlxNJZcztjZ2ijP3
         2Zdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795508309; x=1796113109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClzsYNhGBIDno1QrHtcA7NKXp8FCTC3k0xH3/ql+Q44=;
        b=ll7ATE9CKmIrwUX3g3Zv2JC7GAtNOZPkvnuuZRvuDOQVJHCfRZS42uyl8Ousr70zpo
         E+JUXVypDwOOTGzcQpXv5AfZBKFGfeLzBF8+2RNAVgngMOQcHa1vmynvstej+4s9Mgzj
         SX+TCBB1uf1lgyrZsPzNDT9hxJMfHhmuuSPgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508309; x=1796113109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClzsYNhGBIDno1QrHtcA7NKXp8FCTC3k0xH3/ql+Q44=;
        b=m+Z1yNGu3/cdbVlTJQHQmGkArSBm7EcBK8RTnOT0zPxNm3yfPhKkrIqeV4FYGEU3ol
         lzAudchhs3fjliurflp2QT1/AqRfYBCnSbMZ9AkML/eUIktI6pMlk/zXRhuEn8Q44zSA
         X6UWjdGioue7BFG3HqwBPZp4KMlB0iIKo2epfoO8SQDkShxsYA+FHvjIAksmWRP52grm
         Wt0EacGlG+hATZGBEpB9knjJVv2ueDdNTMO7aN0xEIZluCd38rZ82pB8M+jbGcCTRd2+
         AAN0MQCH65iTfb1rwURiWD4jRtXUIQoVibMspW1SUKbDo4Kxenw+WoM1J8EHgSljwVio
         SXtQ==
X-Forwarded-Encrypted: i=1; AL+hErFvg8d+xHNghrkIjeo+4raU9/avcyoGnqLEX2Rx0NEATz/qPd/nnUSPHOru+Hd3DWZVbhHHkXZ9alBdiYzWzJpp5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PoIKLfwg57T+ZfrbwnW1s4LAYq/QI7NFwnOYHTtr/Y1SnJS5b
	Tlnr3FnGKoRhDp3GX2MTRcMi6g8BgjC1CS5KQjKwdBQ2Yc3x+VIlk2eEsn9zTRAViWIrfkh77Ye
	gTrKP3Fk7rwUfNhGsEanCXTkDtdFR76a26S4TDRvq
X-Gm-Gg: AZFdTZcU+XQ13qlPCrBH861+EYDoV7f0bmZMQK9H13cBn2hVI7We2seIQVQRVsTK8VF
	zjzJwm561u0UchBvps67LH5wtBqBxK5P4Sbn3D9eSf5ZDTRycBPwC99BgvG/lNVGQBuXFvSgur7
	rtQLLaiPxjAqZo/iomXpTO8cOteQxRDjRY34FMg/tt4AkP+fV6LTOgVp+dXqVTYWrbFe0zgFKgk
	nYic1SyqYonZ9rfrEx/IN1qfQSuJTlpWFYuRELfjLQcVy6pO7DRWPXVuYkugNRgdILAp3oUF/9c
	FIAoNqfPgh/M+DV8qD5nHnZqYu1qhaMN/8ZOTYMedUSe8P16Lk/p7C0oeDb0t/IjVOPkWdXYB3r
	Pc8IVx86u3DYF5HIYgRiiCP/gGOCP7uDebuXW5qMBd+W9gREaVgQRqzevsVhQgnOG/MM=
X-Received: by 2002:a05:690c:998b:b0:8b0:9f2c:cfa0 with SMTP id
 00721157ae682-8b5204d651cmr57190517b3.44.1795508309300; Tue, 24 Nov 2026
 00:18:29 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123113755.3033436-1-wenst@chromium.org> <20261123113755.3033436-2-wenst@chromium.org>
 <TYYPR01MB6603FFE6D156C9E84C9891DA86452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <CAGXv+5E5fSyU6gEPk7BLQdz6wXpgSxaXShM_zTtjuim5W_pxdA@mail.gmail.com> <TYYPR01MB6603B7932D3122DF0622230F86442@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB6603B7932D3122DF0622230F86442@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 16:18:17 +0800
X-Gm-Features: Aa3M54qAJz3E4lCBf4pR4hRw8s7Agur21vfzxnOB4r_CYaJwBGfQ8glnAjpqec0
Message-ID: <CAGXv+5HmXyVn6dY3Ve6ot28p=08giJ00SoXmpfcaSLoZVgbCyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] power: sequencing: Allow desc=NULL in enable/disable
 stub functions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Chen-Yu Tsai,
>
> > -----Original Message-----
> > From: Chen-Yu Tsai <wenst@chromium.org>
> > Sent: 24 November 2026 06:20
> > Subject: Re: [PATCH 1/2] power: sequencing: Allow desc=3DNULL in enable=
/disable stub functions
> >
> > On Mon, Nov 23, 2026 at 8:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Chen-Yu Tsai,
> > >
> > > > -----Original Message-----
> > > > From: Chen-Yu Tsai <wenst@chromium.org>
> > > > Sent: 23 November 2026 11:38
> > > > Subject: [PATCH 1/2] power: sequencing: Allow desc=3DNULL in
> > > > enable/disable stub functions
> > > >
> > > > The non-stub versions of pwrseq_{enable,disable}() are no-ops when
> > > > the descriptor is NULL; however the stub versions always return -EN=
OSYS.
> > > >
> > > > This would require more code to deal with on the consumer side if
> > > > the power sequencer is only needed for a subset of the supported de=
vices.
> > > > One such example is the rzt2h_adc driver. Only one of its two
> > > > supported hardware blocks requires a power sequencer. The driver
> > > > could be built without power sequencing support and the other suppo=
rted hardware block would still
> > work (provided the Kconfig dependencies are changed).
> > > >
> > > > Align the pwrseq_{enable,disable}() stub functions so that they als=
o
> > > > return success on NULL descriptors, acting as no-ops like their non=
-stub counterparts.
> > >
> > > Could this make debugging harder? If someone disables the pwrseq
> > > Kconfig option, the stub returns success, so the power sequence is si=
lently skipped.
> > > The resulting failure (e.g. card not detected) would then look like a=
 problem elsewhere.
> > >  Should the stub return an error such as -ENOSYS instead?
> >
> > I think it depends on your code? The (devm_)pwrseq_get() stub still ret=
urns ERR_PTR(-ENOSYS), and if
> > you pass that to any of the other stub functions, they also return -ENO=
SYS.
> >
> > This change specifically targets code that expects pwrseq_enable(NULL) =
to succeed.
>
> Can you please point me to a driver which expects stubbed version of
> pwrseq_enable(NULL) to succeed?

It should be the case if the power sequencer is optional, or rather only
needed for a subset of devices supported by a driver.

The rzt2h_adc driver binding to "renesas,r9a09g077-adc" does not request
a power sequencer, and thus calls pwrseq_enable(NULL) in its runtime PM
callbacks. I'm arguing that it *should* work with stubbed pwrseq_enable(NUL=
L).
Obviously, when bound to "renesas,r9a09g057-adc" nothing is going to work,
because stubbed devm_pwrseq_get() returns ERR_PTR(-ENOSYS). But that is
expected.

The rzg2l_mipi_dsi could be another example, except it works around it
by putting the pwrseq_enable() call together with the pwrseq_get() call,
and both are gated by a hardware feature flag. And the driver never calls
pwrseq_disable(), instead probably relying on the implicit disable when
the descriptor is released.

A third example would be my USB pwrseq integration [1]. Power sequencing
support is optional, and the pwrseq_enable() call is currently gated by

    if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
            return 0;

which would not be needed if the stubs are no-ops when desc =3D=3D NULL.

And there's also reset-rzg2l-usbphy-ctrl, which has:

        if (priv->pwrseq) {
                ret =3D pwrseq_enable(priv->pwrseq);
                if (ret)
                        return ret;
        }


Besides making consumer code easier to write, I think another point is
to align stub and non-stub no-op behavior. If "desc =3D=3D NULL" makes the
call a no-op, thus implying the descriptor is optional, then it should
be a no-op for the stub version. Different behavior just makes it harder
for users to write code around it, or making POWER_SEQUENCING a hard
dependency and not dealing with it.


ChenYu

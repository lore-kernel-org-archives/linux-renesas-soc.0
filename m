Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795501204;
	b=Q8Go/vvq3WBFGjgQ8XALi/DKcNhJZDgreN6y+1GJlgjKrmTLydHNHbFhQ/D65RWHptS1
	 YSKVuR2im//da/HajFBWgljEoJPIVPBxPhDSuGIGInQ7+9Aub9Pt195C5rVly37nzupoI
	 VzQAADZ2LY5YXUhhEdhJiZFAI6ocMe3OjNCKmU1ji5DyGS6/WatV1AGqf4D83R2UJ2/Hx
	 vtBauvK6NpP67sFBmcHC88QL7ga0mTUpV5MKfiyr/f95MRH6DlhJLg8stHuh/kB6JYc1T
	 6m+ke5DaZ6dfjdajSJ4KC9u6eAIou7++hXdemuyBmxHMScUOhzSA8VdDKVEvnUYeifA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pI4cY4bgznXKJ4A1hmZr6uhBddx8lY/IEe8WYtmh65I=;
	b=lnc963PwBpsaTiKRch/T4/mCf8yow/4WqaSPTldD7P9QWpQJELIc2Df/vmBcjRn5lJPU
	 CKSoimolbShj9BzsmmQshB7jbJ4hYsk59NrJSfsdyHfBv9eCDhCUnNdf6ugOJeOsBeqMg
	 ZYWadjTu3TcnDVJkTaRwICtcoKmbbr7LSL9I8Ughw8BAdAJbLc1fZE0SgF8m5hzIgN+Sg
	 WsxJE+1YiWKW4oJLsmqswttA0SjTgKRFKOfgTchvwgX3tjQyEBb0GzsI34WpLryfIX982
	 Rtm0BVTupfAE+Z4flWeQGK6y/ud48kfJk/+dX9bEfm9XDbi2p2hLTV1yZ0mkKVmheHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gLQh06ZX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E707606A321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 06:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E707606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gLQh06ZX
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e04eda5aso29808127b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 22:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795501202; cv=none;
        d=google.com; s=arc-20260327;
        b=eyyxylBIZy6b7og1ZquiJ0/tJbplSRf08Fukg3rwice8q3wo3khQVZJ+ZXaved5whC
         GRuNNJMQvJYgM0pJvqn8Gu0QMy9pWMZtBTjllOEXuXivetPZa/sLC4f1BVSDxJ/17bJ/
         jEwaEzPHjWX/a4+qMoYjYFvs18AsSzr2N18u8mFLCj7EGR/FCC1GjhzHMBFMUHJsXMno
         LIOW8Jl1TKwFUK7tPcdVd0erfhAm6RpoTnuSM1YaufrTMQCH4Ot9PLXZiR3+i+nfiVLG
         nHsrFlCYYiC6rSICtABBjT+9fi9YMVnbl7On/337Ay8hYxARowBahi0qHRGCmA4nZh11
         UONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pI4cY4bgznXKJ4A1hmZr6uhBddx8lY/IEe8WYtmh65I=;
        fh=nx667bCVDcFAVnFl0GAf89w5pWlaqo1QLT/vGYNOcOk=;
        b=pM8BnO1ioj+2FyeqiFXfwg4SVNe2w8fAR//6mKzHXA7zxcqkUivqj105SxdhiNZlU5
         sgmDGzUrimpg2CSQ+RoGO3B08N12zhSeTiElsr++7+nQFLJaYFI+gNbs9m1D/Y8WFD4J
         5ydLrHmIn9aufoqBvBzqsTV11UWU/gF1MZFMK/L/TCvcoFbkaSC15Aij93ItsIct71yN
         +3MY/QDAOR1jDsgZmaosBfNdZzTwAl+RydrkKKP5iITou+DUvGPORNsgAhNMr9/tXDJR
         8ng587iFbtgKNEKA8jBmRawzaSk/9M8JFXGSWfZnR2WTtRkqNjz0g9kjYM9TM9lTVrRd
         TWXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795501202; x=1796106002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pI4cY4bgznXKJ4A1hmZr6uhBddx8lY/IEe8WYtmh65I=;
        b=gLQh06ZXN+nXp1eeOgp/W/m9EQcb4H6xxbAtyBqkY2Re512Zn0YieDfPUaKgVNKnaf
         wsyJvbnWySDCo2sf8C5Mg56I+TKOuiVvALTqyjKc1h3eZrL+J8OIfnMcfXINEb/5SB4g
         jYSFvQACzQeoK7mOXSeU5JhFzNnUPbcoC20xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501202; x=1796106002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pI4cY4bgznXKJ4A1hmZr6uhBddx8lY/IEe8WYtmh65I=;
        b=mMOq6aTrKu6Eu29X7fTnJlWv9Sfl0J3Qxyor+K447VkzWmJsY5rej1r0tCLfeLtMRi
         Vc046UlMG55wtukU3mLZ/Sc8r7WLMWZt7cJIQiG13GG9wJCctkiTw30gqkVStrWwvkvc
         nzOekdKuZxP5fKMVeNInb53z0EfKogAejjdXVXEXkUl1FKEbSEpahWX4GG2lnHb6S78F
         rPjLN5h0Wy66nm6tgWjfkbm/SrGHSmrsa2I55VyZ1jYNoHuhvz2pEwXUSBn6pDjhiBDF
         zwELNjX3D7akVugOp7RrnWvoYkRQGBjpKpUSi7/P9V5nTN1BD3lz7dXjwS7/UEwnRqz6
         znwA==
X-Forwarded-Encrypted: i=1; AL+hErFmK0XqYt7g3WEfvNchyjuOYN08wuZcvGrmBMlHdsJp5HRlmfaIVuzvlGCQxS0U09UvUvpaj6lolLNDetGPkbTAvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oYh50XnROzP4dec+mVdzqYVbcL+W97M6ZOxzdkbKevpXDNkuL
	IV5XRW76mXQBE++OwmxenZaKmcysj6UkvBTOaAFfNpmka2CDL5CWT0NA9F1gN766P2A3IO5YvaO
	3Q+GLhcS/vCH816RSpXv/OHhZ4seXZd9hX5ifrQww
X-Gm-Gg: AZFdTZfCHnX4gUOs0Pux6ZJD6613D55hsovsoam6a5oqoAotNLywwyPfQI1TQo3iFAi
	1s9zfLKdkkxihxG/PJmdxS4MwvK4L0cpr3pKlGGCjtpih58aJexqx4bG6tadcKF7SvagomJoDkX
	uUoSu5tYxzZ6AhIKWzer+jZHKUh9JiVlMcDVBeYAC/EYZMggIoLc4j7zfAa4eeS2Dhatydpp1ct
	r0nM2I7AnmRYbdbuccpOwKstlk0p94HQCNYG2yrmkP27LoNXVKmjVU2qhnGt1RwoOP4EmdKWPeu
	UEbWNfnYrZeDbXCRW3q5IpUxb0+OjtqTTjb/meoyyMU4FHrpEQCb9Y9yc/zMfIe3OTmboltN4AE
	ovN36Bp/gSQ2/JFslHnCxN9jvGdAJLvn8wYMPNThDhFiz0WUnJ78r70mqiuv6TUi1RPU=
X-Received: by 2002:a05:690c:2a87:b0:8b3:3fe5:f6b3 with SMTP id
 00721157ae682-8b520537719mr57934737b3.50.1795501202456; Mon, 23 Nov 2026
 22:20:02 -0800 (PST)
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
In-Reply-To: <TYYPR01MB6603FFE6D156C9E84C9891DA86452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 14:19:51 +0800
X-Gm-Features: Aa3M54ojNfKajFSsYfJiknRIvLbdnHGoigTuXBmWZPLKOqIabbjntbCzug34xtM
Message-ID: <CAGXv+5E5fSyU6gEPk7BLQdz6wXpgSxaXShM_zTtjuim5W_pxdA@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 8:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Chen-Yu Tsai,
>
> > -----Original Message-----
> > From: Chen-Yu Tsai <wenst@chromium.org>
> > Sent: 23 November 2026 11:38
> > Subject: [PATCH 1/2] power: sequencing: Allow desc=3DNULL in enable/dis=
able stub functions
> >
> > The non-stub versions of pwrseq_{enable,disable}() are no-ops when the =
descriptor is NULL; however the
> > stub versions always return -ENOSYS.
> >
> > This would require more code to deal with on the consumer side if the p=
ower sequencer is only needed
> > for a subset of the supported devices.
> > One such example is the rzt2h_adc driver. Only one of its two supported=
 hardware blocks requires a
> > power sequencer. The driver could be built without power sequencing sup=
port and the other supported
> > hardware block would still work (provided the Kconfig dependencies are =
changed).
> >
> > Align the pwrseq_{enable,disable}() stub functions so that they also re=
turn success on NULL
> > descriptors, acting as no-ops like their non-stub counterparts.
>
> Could this make debugging harder? If someone disables the pwrseq Kconfig =
option,
> the stub returns success, so the power sequence is silently skipped.
> The resulting failure (e.g. card not detected) would then look like a pro=
blem elsewhere.
>  Should the stub return an error such as -ENOSYS instead?

I think it depends on your code? The (devm_)pwrseq_get() stub still returns
ERR_PTR(-ENOSYS), and if you pass that to any of the other stub functions,
they also return -ENOSYS.

This change specifically targets code that expects pwrseq_enable(NULL) to
succeed.


ChenYu

> Cheers,
> Biju
>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  include/linux/pwrseq/consumer.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/con=
sumer.h index
> > d24b5af3e49b..5b3c61e963eb 100644
> > --- a/include/linux/pwrseq/consumer.h
> > +++ b/include/linux/pwrseq/consumer.h
> > @@ -54,11 +54,15 @@ devm_pwrseq_get(struct device *dev, const char *tar=
get)
> >
> >  static inline int pwrseq_enable(struct pwrseq_desc *desc)  {
> > +     if (!desc)
> > +             return 0;
> >       return -ENOSYS;
> >  }
> >
> >  static inline int pwrseq_disable(struct pwrseq_desc *desc)  {
> > +     if (!desc)
> > +             return 0;
> >       return -ENOSYS;
> >  }
> >
> > --
> > 2.56.1.831.g720f3f5937-goog
> >
>

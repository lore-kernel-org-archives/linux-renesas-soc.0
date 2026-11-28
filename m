Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795855033;
	b=eDrxvaUB+t2aeMuN/huKlroztiGWqocFnbl2HiAlwru4/u44w4aw87qROYYgckLqeor8
	 EuLbpDrIDvlA81++5HCTrcxg2zuufmfluZgtpJuAvneOq3PfnA18zDBgFdkMWjR8A4A9X
	 E0ZvbdtLsSIvd+EpgdfLkWBWhinYrvrIyIpDPbCxjnu4W7dslH8cws7RCNqd//ISdMiTA
	 iqMaAlLgwu1PI0t1s1YPozSWoEYnhCpgKrkA2XTTRjhDmacheSKWBLk8VW3DmFab6dOME
	 idYMY08lprAqrScjk9PpCjjhnmuKcRZb/h7byqJef2FjJGyssfTTkpbJ/ndcp6YWdEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M26H+8bofFBd9Z7cw5bx5pswgManSlVt4RQJzdEkUlc=;
	b=IhXgemDGfcrTyLDIhFA/rv1Y6VJbrc3GJ9TM2JP/7lLVRjFrCJonQqLjzGNZRkYbCZB3
	 JN+39iqvNPw6VcwWrICp9O4dfKSVRwCxJXiVDi2CKi0Cvr4/dnDGY1LRtA8sruiXeC/sg
	 2h09xTBt6EA7xLFMWS7hoTspL0JWRqVy5h1HP6oiJvTIVd5ztQI6xb2f1WgRzooR1W69y
	 gw8G1T0yUnspHR3/jwv1ZP2CyvodwbFGym/W+gmYLrQC++SqR7mPWbmWeMdnYWlH8xVrX
	 9flJJQSQEp9bGxAgUipEW7My57GrtdXjGUu2l9UZyJ9414YQJ37/4uy9ZWP+rT4fmfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njmKpk6s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B68606A31F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Nov 2026 08:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B68606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njmKpk6s
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94965745d92so868241485a.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Nov 2026 00:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795855031; cv=none;
        d=google.com; s=arc-20260327;
        b=J9PxYCfLvEGqOY2NuSXww1nEmncinhEFljfybptJJHAmnDJXEfqU61QQGxZm9Lg1PP
         k7UzReChLZZLeHDxwkJ1d9afZZxEVI1hpb4VuMk0nQJFdGIf2ibSV5q3sSZHeUx6/o2L
         93P+Gt6WBiwQKXXiVDrZTsR1TdPgy7XRyjGVY5/75mF9OFy1GSgo/o5tZdTNbK0o0ghI
         zW/auvUwjdztZYe2/501ab/SSnDEPCCMEOjnSGTbXfq15vlWZm+AHQsfmcpcx0LhFQbl
         0JpCU8Y6tIlOxCgWdkTOLjFDXYFGCDq3vzu8RtB0kpq87fDA2QWyeW1l0iB/JZuIbuN3
         tv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M26H+8bofFBd9Z7cw5bx5pswgManSlVt4RQJzdEkUlc=;
        fh=nPnuV6CYzh5VJLX6cmBkDMWSuomIg+6KDKGpZdKP8R4=;
        b=WtLjWWdxX0ITDr9eK4ggM5+mhRY3KDYrs+YiJ9H0sG+qIPf93j4B5A8plm83lJ5xNH
         tzS4eJWxBBevzeC3TmqXl+U1eMS4Qnivnr77wwtNsmkEaMufEYPJud2P8SXFcYyJTo/q
         naeailbMES4iadvlCi4PMWr6FAeCbfro8LxjMGI8/7soT8EFdIaxMyHC75ZkjLKX9OoB
         B1OJ0pn2RSzN0qINLN9Vk+/kMrXd7fQHN3swLgL/nMup/qTzQFpdp6NXB7hE9YsgqZ5m
         FqSIVRSDTP4IqtXfm6zr+OR4APW9Om4udDBiAcbhQyR584LOQHp2+MQS7q5WYMWvx3gG
         45fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855031; x=1796459831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M26H+8bofFBd9Z7cw5bx5pswgManSlVt4RQJzdEkUlc=;
        b=njmKpk6s4qhe7O2iDTyobvug2dIjyGj0Fzx/KIqAXCbcol+CcEl/r2zk2wQSogfyBB
         lBYqFekerHln6fPqjCTUdKES+bLEoQAmyJCVQMq8C3eWLzb0kU3a6W85alNvnc34Brkr
         8DgDmg5relquPau2Pp2H+6RJaFkLPkoPblw9H36iP22lOKhGTpxw4R2wxrFo/iBJDwfE
         ISUpstdd7eVtTTgRLDYAFGmB5QpgVBEeFvb2552vkYFFWWHP7w+0YltpAbP/j3LCrIaE
         HtRn/Voi4V0yfLdc/uWQPk4jK/0V/zFRS7iitLKMvYuroBTCVRCDN+yIvsGfWWsieZZ1
         e3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855031; x=1796459831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M26H+8bofFBd9Z7cw5bx5pswgManSlVt4RQJzdEkUlc=;
        b=B6nKT6LgqtMoUBjsJb7q1enWuiGz7Ymh/nAhdlY/78ue7EnDm5rGK3nIbKU9WnywWE
         c4Tx5XBIyrjybYGoE2jHmnQobV6uXvjJ/xvrPboEcbIdanCVmk9kPu0sCn0kz7BRmcXy
         7N9YZrZ/JOgRrWKats2qCD76ijIw1wouPOHA/U79yVqJpKZ6hm7ydYYQOlITK4Hbchwh
         K+noinZjeF+j820NT+RdQBsAIp/+VemMKLCv9Em4cs/C1QPLjHeDQvrowobWxrs9O3j8
         bkXViq1TOU1wVuIggE4Wugz9mFVrsQejcpIxeNCv4C1NmhgjmC8Mgz6OWwiYtHrxqJEF
         nPdA==
X-Forwarded-Encrypted: i=1; AL+hErF1jCNLRB3qyIoOzeSP2C1hnnFFGG9z1kwwK4OdRQqHlL5LZ9KlT32Lt4kL6Rsgsa6+DLnxJ90ewF6NdRLVGo1d8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bQ/lgL27lN1QxJMzPQKzDp00IhFNiLHcxnFBcTV+ExlQ2nPW8
	egaJj325ApQc7giseOTCAzKIKiEXtNxDcPBQbK+anpahgaQ8af0KXQYm9YhZzmbwo+uZtx18Gqv
	VsVxgOqAVP0rTyt+CkfhsTz18zbNQzHk=
X-Gm-Gg: AZFdTZcx95Rf3kpFCtn6ZqB15TqgJI3pERaO3n4lZY5dICvfPxLmh5j67ZcgsDMN9Kt
	OIvMv+EKTApk160/iVdxrMzBCAwaBcsWMaPBlyUXxWJKvavt1lRWfaoEQZ9j3ijNb1JmV/eGMKh
	7nhh61FSC5MqX/uIwtSMDaa38XrKiZA5q5UblzItUuypxGQDunLYKuPnX88dosFAQqRT5O+La6f
	OzNIARr98y98eNGGvbwGIReOtA9Bi9Jp4JCl/JVZmotmEwnhg8bLMMVwj556YBngMSbl4n1ZGjL
	qiXeDxDh02Th1WhwZJZV0kB4V9bosxJe3+3O1GW+tQT2z4kl59fJuk+TBGYW3ZHiFhh/ZBM4MTq
	94MZeLNKWbAF9VUKpyYs7ccQXMpIO/cTqrQCImGv7LrTZoFT1hVpF3I7aNkGPz1VSh0ao1TmDkY
	lgokTsGgogZXMlT4b8DV1p2xoOkhQ=
X-Received: by 2002:a05:620a:460e:b0:93f:5677:9950 with SMTP id
 af79cd13be357-949ba9e7547mr4898012285a.53.1795855031620; Sat, 28 Nov 2026
 00:37:11 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126134826.46044-1-biju.das.au@gmail.com> <20261128034348.5e1de2c7@jic23-hlaptop>
In-Reply-To: <20261128034348.5e1de2c7@jic23-hlaptop>
From: Biju Das <biju.das.au@gmail.com>
Date: Sat, 28 Nov 2026 08:37:01 +0000
X-Gm-Features: Aa3M54rJNh1b-FgYgZIgDSaKNrHYIH8_ZoI7lbqqo6o6KYmRbeb2_ZWxai4GFk8
Message-ID: <CADT+UeBLU=8z+YoVSiW60gHPmpRJ1XHX+G1=pcB4+PkhTuEi+g@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: rzg2l_adc: Add fwnode_xlate() callback
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, Nov 28, 2026 at 3:43=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu, 26 Nov 2026 13:48:19 +0000
> Biju Das <biju.das.au@gmail.com> wrote:
>
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > On RZ/G3L ADC1, IIO channel indices don't map 1:1 to hardware channel
> > numbers. Add a fwnode_xlate() callback that finds the registered channe=
l
> > whose number matches the specifier argument and returns its index.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Sounds like a fix.  So why no fixes tag?  If it needs one then reply
> directly to this email with one and the tools will pick it up when I appl=
y.

Yes, it is a fix. I missed that.

Fixes: 39e16807997c ("iio: adc: rzg2l_adc: Add RZ/G3L ADC support for TSU")

Cheers,
Biju

>
> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/adc/rzg2l_adc.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> > index 340813f6f890..f00cfb897124 100644
> > --- a/drivers/iio/adc/rzg2l_adc.c
> > +++ b/drivers/iio/adc/rzg2l_adc.c
> > @@ -286,9 +286,23 @@ static int rzg2l_adc_read_label(struct iio_dev *ii=
o_dev,
> >       return sysfs_emit(label, "%s\n", rzg2l_adc_channels[chan->channel=
].name);
> >  }
> >
> > +static int rzg2l_adc_fwnode_xlate(struct iio_dev *indio_dev,
> > +                               const struct fwnode_reference_args *iio=
spec)
> > +{
> > +     if (iiospec->nargs !=3D 1)
> > +             return -EINVAL;
> > +
> > +     for (unsigned int i =3D 0; i < indio_dev->num_channels; i++)
> > +             if (indio_dev->channels[i].channel =3D=3D iiospec->args[0=
])
> > +                     return i;
> > +
> > +     return -EINVAL;
> > +}
> > +
> >  static const struct iio_info rzg2l_adc_iio_info =3D {
> >       .read_raw =3D rzg2l_adc_read_raw,
> >       .read_label =3D rzg2l_adc_read_label,
> > +     .fwnode_xlate =3D rzg2l_adc_fwnode_xlate,
> >  };
> >
> >  static irqreturn_t rzg2l_adc_isr(int irq, void *dev_id)
>

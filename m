Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488448;
	b=G0reLg63Vyhmyeaag0Zq0ZqIINgUq59kG8QqNPJJ64na8VUbL0cqzSXssdhiV9oHvvx5
	 /95irIv2/GUMzcwNyOaOtM88mB9KU/yaEfzu+GJ2I37YpHq6wfjSH0xqW4R4VttCwlRPC
	 9xqj3b0Nvk2gkGTcuy7OGyNeGnQkvuENiqARBwl+x9OP/ygzffIP8EswFjnHBPvt2DV16
	 PG3TOXp9GZ4Owq6ZT0TIBjYhBDNTh2Tehbp3BZbxKLdR2PIt7uRqTTjR1XOv6D2iom9v0
	 dUHrSIPkuIAllsdLoPqNKNJCoJLSBAb0+mQK/eY+VJiqoa2u1zNpGwLWXaTWdN/dQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
	b=0Vpz2WVMioADVuq2BsF5v4+ELFqDjd8qfE4yWkG/vXphNParFSESlyGqRFptkuG4UDMx
	 aAqeFldbpHOPvHhTHmohpV3BD/c4K4M+pK5uaw7pY3kr7P0+2YvQKziCbvxty8z/EATFK
	 C/BU5gXC33O4//DNmeSkDbffttoM0rHOzdprIzFpepzMtXNIHrKD6enBzcsTriUeXVpXW
	 XZilsWWKhbEz0oAATmmqVB0JP8iuxwG3WsEWIpr59b+ojf/jJvzS+idz3xoCdcWCn9cyq
	 T+Ca5UlC3KsR+xHybfpkbpbUOrPj4Q4vqP819W0YcWYV8fvmWopFdwfCci77ELKc5IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE590606A31A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 09:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE590606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4258105so1730663241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 02:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488447; x=1793093247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=mSHBgts+NvzLSN8lv5tw2DQHAhiTeIgYCBg2TK/1l5lb01yXFdKBQLIANvu8yOf/Sq
         X21GbIHJ3RR+EuWAKVDgxvMMPqXO3BgO2zoLrosHp1ubGT9n5M3YWgUvEFycFfLDBQN3
         5nx39COLBubFCIcHIzI0OVxpxVfFA/BfEIrlkXILP+oJua9SoVa4agI4JL28ac6LigI4
         T8nJHrDO4gPt1jhjhlNrMNNkXdvnL6LHJmhdJp9bg/Q0u9H7Mf7Jlenkuf5MxDPIGS4z
         ZGU9tH2mu3TWO15cERECNATKo7HPZ+paBWjm0Nxih+c5r5vbqmxlYtydEcrqPQVJ70VW
         wbmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0rNnKDP84ybdWho5i7BgGWTSHuDf1EslaKzoTPzKLw3g3n0+e6kMg535PZu63DovScC9u/Gs+K7lXh43hppkjgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/WBhJmmYxvRIJd4NEW4hQ2oXcO7vEYM9qt7Zc3FttKVGf+enO
	pFc4P0j8vsgZKFFo7wdAzBpfbDyBhaENhGi0F/H3jknSfRQciLXdigdnYLwgNjdMHK8=
X-Gm-Gg: AYBFou0LldAyyX/vEC0BU95iymNNfLudUBMoTbJIi/usPZr+S1u8n+RX5al3cx2VdGY
	Ew5EpTiAKN7l2oyqMYMigfKu9nKaJDyNb2I89q6Fd2Od/NAWCMzA5rjnSo0qz6QDOB+lKF0cSWo
	kDKLdc7JDe9M1aj3hs6MJnHXf/LK0IpQDYo0VeAj02tzofqgPLSc8vn5SZnrvRZCPK8vr0LwYCj
	7UlK2ud1Fcpl7aVVMwIzkMEnw9wpxEa4us8EjJgPLB8BSc9g3HnWqBu4w8jPYtRfys2yEyZ5q8a
	kBiDJNuIUnXvKZU6E4hK73msaypXzC089NBCHVOl6nHF5Se6xHHb3GFw78DkNvZAjSjxBLCjyCl
	jqEaLuRf4zdw208NmUa0IiU4g3MHbLfMaIGUsVthiaKQfpDkjipLjMnvJWMti8isHCq/T01OKI3
	EIfu3ssZqQShMtjM8m5a2KrkSJAfHQPwx4yMSEOAhUWg6KxkNaESQGr3bY5DkWorQsyxkqnfU6O
	AoRgiJP6bUX9egE7rzjbVHWq9zH6es50YH6FAW4
X-Received: by 2002:a05:6102:6a94:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7cc36733466mr3369303137.2.1792488446821;
        Tue, 20 Oct 2026 02:27:26 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaca7cc59asm5262191e0c.5.2026.10.20.02.27.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac48af23fso772743e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGRm3ZenX/RWw55L+cDRMrmL6SCQ1WMyRf0mHxE4ih66hEvYgWUwtVyH1BFRTjD4pWNaB5sjcqU+hzC9S9OentTg==@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

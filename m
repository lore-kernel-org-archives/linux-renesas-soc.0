Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BC521ABD7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714434; cv=none; b=slYgs5NyQGBWImi8cC1YWtqE+Zci00TPIq/VCC+qtfqEdObfcE4AQgBq0gpLifkKkmnqFA996KRCXFAvIs8a4qTZK60qMIcAKhLhXNcDiezW4eMGAs2zB9NM4cD+QUFy4jt1VnMsgoeleF+3vMYnA/KK1rF5yQgePbe8PqnU2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714434; c=relaxed/simple;
	bh=xkgFJCp/Zk/sqzv4xyN/NJ242EfBE169OBRzxFIrK7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G413FdRMukWO4wzakQH80qCJQswGvWTuZY4I248IaLYCLKnbHXrSRtEgXutiM09lo0WxhALyGNHewz5sEBPMXKRyVfD7EMCaVz3uUeUFQAbsOT2GXKcQzjSDzX7/iF5EzCSTCjAIRf41m+tjIN3iDDKg479vrB+YBnm9pzaFGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c26d7e951so167426566b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 06:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714431; x=1787319231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBTxHEUUi4J2ttd+XtUaUBMmZySWV/hj2+fFGqKDlJM=;
        b=cPhhCEDkKnsfef9UtvEFHb6PH5imgtiQMV5OXKz0qX8TRSLjS++ZscrDcO1rRGPY3D
         ah3/rq1oy97nQuLj/wOY78OOem9qm5pu7rjUl1rA2/Q5wPqEnjr6zKABsD7x4Lc2yjP9
         cqfK2VC1URK0O1EGPKy+h9znQV1cs4GSqXGewknDMjwmZv+NXuez7d1UyBtbwQNJ7XEP
         EQTzlSZSX5m5xrV1p8YmBJD/i0DC2WJnHUvk7zTZZ3H3U23rU3kxP1lT+eEh757hX1Nz
         yIPyCDPDuDgljf/AM6sO54t+lrk12jbVeCLz1lTJHOmWKQYbVGX2lNMWWtq2YZQOVF8T
         tORQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb8xo1Sh3jTtGO0H7Su2bUSSV52AJ2jqlspwdmuyz3HfWkQfrBGDnDRdCx9QXnaTJH+D1HmaRVGPIxGBTAKAO++A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3bV6bjlBl7F6IU7Vtz3uOOaOcyFAW71/PwXapLE9MLEED6VS
	0wCRsY0j1hkas04FSN8BZ4bf4x1O5ZC+K1ce6W/9eyZiDFEGHs1BQ2bnLqbx74jpEPU=
X-Gm-Gg: AR+sD12bIXCq/bKFG71hxsqfxMNGMlG3wk+wgNRTWkUCBa54gS+bGYlZBWzhLuRHoJD
	dKRgEzsP54aKiQ5nKxSDT7Dcd9RGimvxdmFBHAFiSQuPd2OrJYQMoEkaX+mdqnmEFZA9T+woh5G
	Iz6JcjwUz5kE3ugVdkSVgLKoWq3oL4mya5ZNFpnx1GqFpV8HpadY4HjIAwoZ2V1SGrQK4naJr7l
	GMe3b8Zpg0fCs0HwdauhGdkDPgpXurxXE7qd6M7Tu2l0WPuRCaNDdwKaBl8WENlVxdnpR971vNs
	4644jytAwzojMFumRzPsNjIICyjG2GH2dW3ITibAxup+MsXvJpAKuarlijs7aYBJ3jZd1ccI+QK
	nbMwOG65YuJiGFieM3zTuLSiF3QVvbhZriAyKuViUfZ0PehFp5uYrBfGvQhBLLm0iEV88nySCaf
	YpvksGhFDLTttr89eEb+fk+QwDDEWF6zhRQhNmurO3/40VnwOEROazNnsy7iKKnwP3ghZ6jCO8C
	Mbti1Z+DNxFDdQn3+aeMkVvLA==
X-Received: by 2002:a17:907:7b93:b0:c20:ff26:336e with SMTP id a640c23a62f3a-c212a25389bmr277719166b.14.1786714430949;
        Fri, 14 Aug 2026 06:33:50 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212378d7f7sm103080066b.35.2026.08.14.06.33.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 06:33:50 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso1844775a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 06:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro0SUOTgwWi/NPlaEUKyQQro+MhOFLoB3FRIQrsWhHVKdH703xFXiXpn/FPMMN+nO4jY6ENiM2qQS3fOHsNyOKJJQ==@vger.kernel.org
X-Received: by 2002:a05:6402:1cd0:b0:6a0:a644:355e with SMTP id
 4fb4d7f45d1cf-6a38a8bedf4mr2981067a12.2.1786714430006; Fri, 14 Aug 2026
 06:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-rzn1-miic-fix-array-v1-1-b58cafcc917e@reliablecontrols.com>
 <CAMuHMdWUrabJOWLAiSrSm=r7KbuZn4CrVZiswJsf96U3STaNTw@mail.gmail.com> <c933264e-151f-455e-81ee-6c16a5f11d84@lunn.ch>
In-Reply-To: <c933264e-151f-455e-81ee-6c16a5f11d84@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 15:33:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqeVfmsOYQJMPwF1Kui59dEY38OAKWMr42DtEThpKSwA@mail.gmail.com>
X-Gm-Features: AUfX_mz_hQ0TBj7ICikSgGrzarOlKuc0im7GCeWn2gWIWPpQ5K6KidfPNAk4oAg
Message-ID: <CAMuHMdUqeVfmsOYQJMPwF1Kui59dEY38OAKWMr42DtEThpKSwA@mail.gmail.com>
Subject: Re: [PATCH] net: pcs: rzn1-miic: Fix config array initialization
To: Andrew Lunn <andrew@lunn.ch>
Cc: khendry@reliablecontrols.com, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Fri, 14 Aug 2026 at 15:14, Andrew Lunn <andrew@lunn.ch> wrote:
> On Fri, Aug 14, 2026 at 10:11:28AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 13 Aug 2026 at 20:09, Kyle Hendry via B4 Relay
> > <devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> > > From: Kyle Hendry <khendry@reliablecontrols.com>
> > >
> > > Fix memset parameters to initialize the entire DT value array
> > >
> > > Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> >
> > Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data
> > to SoC-specific struct")
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > --- a/drivers/net/pcs/pcs-rzn1-miic.c
> > > +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> > > @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
> > >         if (!dt_val)
> > >                 return -ENOMEM;
> > >
> > > -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> > > +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, miic->of_data->conf_conv_count);
>
> Sorry for hijacking your reply, i already deleted the original email.

Np ;-)

> This is correct, but could maybe be better. dt_val is allocated with.
>
>      kmalloc_objs(*dt_val, miic->of_data->conf_conv_count)
>
> This allocates objects. It just happens your objects are s8, so size
> of 1. But the memset() would be "more correct" with:
>
> memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val) * miic->of_data->conf_conv_count);

That would indeed be more correct.

Note that there is an opportunity for a buffer overflow below:

        for_each_available_child_of_node(np, conv) {
                if (of_property_read_u32(conv, "reg", &port))
                        continue;

                [...]

                /* Adjust for 0 based index */
                dt_val[port + !miic->of_data->miic_port_start] = conf;

                [...]

What if "port" is out-of-range?
Do we just rely on dtbs_check to catch this?

        }

> And i checked, there is no memset_objs().

The *_objs() APIs are still rather new and limited.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427891;
	b=TYqUmC+J/Tfox9zwsa/J/qmD/8Q2N7svGmpH+jRC9WAFhPpWooVCyfB3YdYGCX8zOF5d
	 6U9TLSbVKRQwxf8/xQYcW934KpxbwTDeM8P6llWmA9FP//n8o3mvQGWDexXwJJARrUWev
	 P/FmSulJRFqJUctOAAlLejjDRM3blabFgW3+WQAE6aQUh2ya+CkZsgZhg5yxojkvBcdFh
	 jpH7KipXbVcb7495kiIcgUfGwixsk28AOa4hqJ+Yy9LE0r7fmWmS/pjUUm8FfTSHybpB2
	 LsqiHPr0GGJ9RJY+1zlSYrQUUaA1UpH6oeglbZPPAfoadNjrkAdhrxIg2OTZ/GtTdnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427891;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
	b=v5wG/Lh/zYup7vfZv7kX4VVyL+W4BfXyqnuoo3BauEPthAP0TyYUqaWS89vUhsksuzK5
	 GqUX4c76FVr5GD3g8jWJVjU42G0daI+3ugkTyIgKAvBtXHm6EdBO5NZwfk1wc7+FkTHOl
	 BAX4Xlp4Ao9yAwpgcYpfU4qZ9FuJUeHjIirl+BZ0Gn0EBzFG5pDzkqojtbFeaEuiGOyc0
	 eWy3+qzB41VSvpsP16EO4hLK4HXwAHHMrPDhOgGKsatgz2j2pL1jtL4tnE/QfGfLAxn3n
	 r2fZrmb+xILYgVFBqsKHJvuVyd/68HUc8QE2djN06/DHOHlM1n2TDbsHD6MTb/9mErQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83A606A319
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 16:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE83A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c263415982eso278662166b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427889; x=1793032689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
        b=JCeyoIljhIlOGUFlLpZxNSRb2Z3LyMnypvB0lfdy71mzsOyYAoEcAXKSFc4ORlMZyT
         6KcoMf+IrqFLORQ30ZGjLJbL7j7IeCYRre+5FsGDSBNRpOE9DvqVl/63raVUhPpZejqo
         kGul7XHSm3lVFpU5dKQiQnebjylStYfLemUQoaw88k9jje4ArOfy5uVHAYLA0cJNT3+s
         fFGre7YFvJ/dC2v8j4cATXFC/KQv+siMioFoVzlJFSVvbpDa+A9OPOjJ1jeQL1PLc953
         b8VlpuYnKLPHITpsSrCtWPRGKsJYTz1jayO+YUGDmbjiwARqun/7uGqKzWQgHstaaiHy
         mhrA==
X-Forwarded-Encrypted: i=1; AKwUvBz3DS8cihs0WbggtswZBvWFzrxy0LaSJQOm2jjVruQaX9unk7WeClYIPACof8Y7jnkoOQjkkwe291uUsUxYG0fpHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJN7JTum0Pr+q1uKzDmmHSrQHVKoJw7LaYa8mz0hsfVKto7Py94
	phKiV7/vNfdy3FyZbiAsKboaLQiLIlAH0reMTDV1iNUCGbxi1Sb9+tmL+IQBzGG5J90=
X-Gm-Gg: AYBFou0aXm7tjCWDtdahljjMDJvHXDVhXyn4GxotTyl8g9/QI22dIwShs1LCgjlDBUT
	VzOflItsTYPcxwrVkeEPpvHx+UsaDTDtQ845I22hdDW5HVylpmnxGpmz9SN1UtO/Tb0vWxg3X4g
	08OMwxR9FUfB9PKkPtV6BQbRIH/B/jm6QpD71vnC0g6OqfuVPm8Pj8PlBfDIPHGPUoZ/bh28AOz
	XyikirB2OGtDpA93mVYAPgfVp1NyuxLoU7pg89W2mOC/gGsKiOa6D5k7XrizNG7FMrJUWb4DicV
	NavCuM8Mz8rF4gP2Bo0alKrM/mtxk6PEab03SagtcVZny5JQYiB9tWUYUPTpsJGUyeDcTsiDSkI
	EKQnMnX9lwAJvzO5LTRI+aoCq69AqQtkmjJoxRzQwf9lDCoofME9mQt6DbxiYs6QVJYUFK+X5Ag
	/tSxXb+6UEpajQZJ1GbGrC/5O7o7YvL/EvW/2+wQUzbVuzyog1oPZlbMpARU83cReHDk2NdXG0d
	kwzu6CnWYmYrZkXDiF0cHSlB/aGyBjT1EYZ
X-Received: by 2002:a17:907:3f9d:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c41a0cd1fd9mr630800766b.48.1792427888974;
        Mon, 19 Oct 2026 09:38:08 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm381209966b.43.2026.10.19.09.38.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:38:07 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c414e5d282eso264859066b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 09:38:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjnDwfslWXVvWfXY6W9AlY6Ttc6HO4RTMw0m6FshRNzBYITBVXAF40MqIPdLjXNeTvaFIrSithX2dkqc5kCWP0Sw==@vger.kernel.org
X-Received: by 2002:a17:907:944c:b0:c40:6ed9:b961 with SMTP id
 a640c23a62f3a-c419a05c502mr618122766b.5.1792427582507; Mon, 19 Oct 2026
 09:33:02 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019160545.GC3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
X-Gm-Features: AclHuK84fhnixZiNIMOwb9AdAvJEMnIe-A6l4ZZgkoIEEk378oR8Z0wb7zPZzKY
Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > Unlike provider-based look-up functions in other subsystems[1],
> > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > the provider is not found, thus not supporting probe deferral.
> > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > -ENOENT[2].
>
> But not in the other functions calling genpd_get_from_provider() and
> propagating the error up. Have you validated that no existing call
> stacks will break ?
>
> > Fix this for all current and future callers by returning -EPROBE_DEFER
> > instead, and drop the no longer needed remapping code.
> >
> > [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> > [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
> >     return -EPROBE_DEFER").
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - New.
> > ---
> >  drivers/pmdomain/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1d55..88c886814a5b9da3 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >  static struct generic_pm_domain *genpd_get_from_provider(
> >                                       const struct of_phandle_args *genpdspec)
> >  {
> > -     struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> > +     struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> >
> >       if (!genpdspec)
>
> Expanding the context:
>
> >               return ERR_PTR(-EINVAL);
> >
> >       mutex_lock(&of_genpd_mutex);
> >
> >       /* Check if we have such a provider in our array */
> >       list_for_each_entry(provider, &of_genpd_providers, link) {
> >               if (provider->node == genpdspec->np)
> >                       genpd = provider->xlate(genpdspec, provider->data);
> >               if (!IS_ERR(genpd))
> >                       break;
> >       }
> >
> >       mutex_unlock(&of_genpd_mutex);
> >
> >       return genpd;
>
> The for loop seems to imply that we can have multiple providers for the
> same node. In case a provider fails, the function overrides the error
> code from -EPROBE_DEFER to whatever the first xlate() returns. That may
> cause issues for your use case.

The code has been like that since its introduction.  Technically one
can register multiple providers for the same device node, but one
can never safely remove one of them, as of_genpd_del_provider() just
considers the device node, and removes the first matching provider.
So I think someone just didn't like nesting curly braces, and tried
to be smart ;-)

> If the of_genpd_providers list doesn't expect multiple providers per
> device node, I would change the above into
>
>         list_for_each_entry(provider, &of_genpd_providers, link) {
>                 if (provider->node == genpdspec->np) {
>                         genpd = provider->xlate(genpdspec, provider->data);
>                         break;
>                 }
>         }
>
> to make it explicit.

Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

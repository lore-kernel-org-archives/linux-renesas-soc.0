Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4907C7EE2C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  2 Jun 2023 11:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbjFBLXn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 2 Jun 2023 07:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjFBLXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 07:23:42 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15E8194;
        Fri,  2 Jun 2023 04:23:41 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so2111300276.2;
        Fri, 02 Jun 2023 04:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685705021; x=1688297021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQJ/6UDujFLjt/u17sCfKwDJo4mclYFIu5oHUs16qZw=;
        b=CjkSBswdSGuTuo/nOzgzaTZPktA4heCa+9XnA3SXkz81i9UTLlPUgC/BUPzlEXdQ4j
         oQ9D/S+nQihza9hWPgH9jI9D+oWsm5HFQ9/y3er2d2V4cY1QSQECcSBqRc62QrksMbxZ
         AitUoYCrKVoRFyHVWui9ivbE8l5JbQiFuG6dsEJmiTAQfdRJ93V70hBv3ctG2KC+7YmD
         2ruX8AqAFbIbqTtW/b2vqJlrtlIqleuTF+WI60GFhubLINlfYz+JFTld3EfHbTGvwgCf
         PJrCMZiC2jN2RwLotVuuRceQrpBdyJ1SzzruRp1PUA1/IGKeVJMNTcUXgl93sFFA6QU0
         SixQ==
X-Gm-Message-State: AC+VfDyOzj7bZ+9zbJZlyGXNhb5SvZTHe1vt5uDFfk3/bVulN+O5WfkT
        0RnoXQZdkfBe7dQXWGMaCaQmw9z4miO32Ovd
X-Google-Smtp-Source: ACHHUZ4iY4gZwGs9mBdx69WzARuZNtxdyKIzxxxIy2hgGUoatdsG5vFQLZvN3nBBW1XR1/tx1iYzwQ==
X-Received: by 2002:a05:6902:249:b0:b9a:2f60:d638 with SMTP id k9-20020a056902024900b00b9a2f60d638mr2659186ybs.37.1685705020776;
        Fri, 02 Jun 2023 04:23:40 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id l197-20020a2525ce000000b00ba87bc06fe5sm274548ybl.52.2023.06.02.04.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 04:23:39 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5694f3a2b70so5798887b3.1;
        Fri, 02 Jun 2023 04:23:38 -0700 (PDT)
X-Received: by 2002:a81:d250:0:b0:565:bf0d:e27a with SMTP id
 m16-20020a81d250000000b00565bf0de27amr14382323ywl.15.1685705018386; Fri, 02
 Jun 2023 04:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685696114.git.geert+renesas@glider.be> <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
 <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jun 2023 13:23:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDUT6GbLvsrZjkZj+LKPD=-yYY2vnbP-K+i+yMAeHy7w@mail.gmail.com>
Message-ID: <CAMuHMdUDUT6GbLvsrZjkZj+LKPD=-yYY2vnbP-K+i+yMAeHy7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Javier,

On Fri, Jun 2, 2023 at 12:39 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > The section about converting existing KMS drivers to atomic modesetting
> > mentions the existence of a conversion guide, but does not reference it.
> > While the guide is old and rusty, it still contains useful information,
> > so add a link to it.  Also link to the LWN.net articles that give an
> > overview about the atomic mode setting design.

> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
> >  really want an atomic modeset interface, so this is all about the bright
> >  future.
> >
> > -There is a conversion guide for atomic and all you need is a GPU for a
> > +There is a conversion guide for atomic[1] and all you need is a GPU for a
> >  non-converted driver (again virtual HW drivers for KVM are still all
> > -suitable).
>
> Are any of the virtual drivers not yet ported to atomic? This sentence
> seems to be outdated and maybe you could remove it on a following patch?

Good question.  I'm not sure which driver(s) this refers to.
drivers/gpu/drm/vkms/ was introduced much later, and always had
DRIVER_ATOMIC. Perhaps just the boochs driver, which was converted?

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

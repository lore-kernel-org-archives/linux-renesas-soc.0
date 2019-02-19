Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C77C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 07:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A68FB21848
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 07:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfBSHxi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 02:53:38 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42814 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbfBSHxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 02:53:38 -0500
Received: by mail-ua1-f65.google.com with SMTP id d21so6652176uap.9;
        Mon, 18 Feb 2019 23:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4UxPTHdTrjHGCOWpwrFo/C2Vf6EZL3yWskXVpNuKLY=;
        b=evKt7eNn4ecY7gNiQwMV0RYE+HrBa1ejk/CU2a1TEEzBxu04jlLC2JiOhuuGCUObh+
         w15bfJMmVtJNV82hxLjTVBMDmUT2kCdDYah4DaUsYV3g+lp4qdWBpRR6n87rf1gTBu6V
         kWZGjwdUvW/zDNnpnZHu3rUuLON/xm4U01OWUXhHyOdMoMXjnZ02E9T9nk2G9zcHPc0S
         JwwGRdDdYSoEH3rq5d1MDa+jryavZ5j8J3bC+pmza/e24Gmsb9fjA3bSyTWLafwwxaBR
         /u5PgHkNt0jTRJitBhMOpTO6yvjp1XEVNAc44eF2ACrXnPVZlcNqu3oaBm1EHZyB8ZUS
         lSdQ==
X-Gm-Message-State: AHQUAuYyNCyNCGBTVIpyJwpqIu1tXEZ4y7eq35li5jlfh9l3bvErURg8
        kN29BqTQRhwBcS49LPswX8kxCehpX4ibx9gyFe1kyA==
X-Google-Smtp-Source: AHgI3IaL/KvrI8RFQ4I59c6bdkb1DegoZ0Zf9jUl+Sdk9nalvjj16ADv/G4wyvXIZXTFsbafEIU5kpaxSimegESlO9Q=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr13965030ual.20.1550562817314;
 Mon, 18 Feb 2019 23:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com> <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
In-Reply-To: <20190218204122.j35itmqth3avo3a6@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Feb 2019 08:53:25 +0100
Message-ID: <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration' injector
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 18, 2019 at 9:41 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > +       wait_for_completion_interruptible(&priv->scl_irq_completion);
> >
> > Error checking/propagation (-ERESTARTSYS)?
>
> Are you sure? ERESTARTSYS belongs to the "These should never be seen by
> user programs." group.

How else can you inform the user the operation has been interrupted?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

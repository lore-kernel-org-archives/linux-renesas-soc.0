Return-Path: <SRS0=rwh1=XE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8A2C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Sep 2019 12:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6D10218AF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Sep 2019 12:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfIIMTz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 Sep 2019 08:19:55 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44426 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfIIMTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:19:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so12163122otj.11;
        Mon, 09 Sep 2019 05:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAs+I/TUWNnuZxjBLkhMPEU/aB/qK/a1ubupalPvRNM=;
        b=kvARhY7gMlC+QDG8ssfjOtovz7uqNALBJXUNhYyrUGeRtWtLErquyjWBBly8X9MNx6
         43MsdwSppV2akqLOSzcJ2r7cEURUqE2F30VUyl+SRe8ooHjPmuhmrndJm0oS3N2K4j7D
         lbKY3wPVUawd8DdbLpg/galjVEoIO/9vjfhrJ4qebFFTzaUf0vUCePTIMXDxhHo3mAjS
         scGc17D4HwjyNXxqupKDL3sQ6bmHClyUWSzVvh0AyNlCuCdNbSn+0EQOTJ+FKhUcshNR
         WuMIl9mARedT9waqPVori8qnJXU8CkQYm923b5G6YglqBChhGn9x/U/oDSPIyPS/QfCs
         mLpw==
X-Gm-Message-State: APjAAAXs4L/8onEmjVfw5XtXGVpxyt75UA0m0iJJVBRdeZIwct0WsEAr
        XIzGaRVkBaz3dEAS/70HyHNlBWTytZQ0ibofUB4=
X-Google-Smtp-Source: APXvYqyptPd5sOFScdZMIqoXjAUOP6zRtrFpMikBU6vLhMblwgtk1ROqKyFlh+vtR10XFif0HbP/vbM1Kbvhs9zwboA=
X-Received: by 2002:a9d:6c12:: with SMTP id f18mr19752837otq.297.1568031594332;
 Mon, 09 Sep 2019 05:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com> <1567675844-19247-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567675844-19247-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:19:43 +0200
Message-ID: <CAMuHMdUTMi4R3Qno+QvpxVMP64_ScV+uF0A13XXpOGCCR0c0zQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: Document RZ/G2N SoC DT bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 11:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/G2N (r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

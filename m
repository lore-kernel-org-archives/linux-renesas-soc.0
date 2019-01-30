Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1226BC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9D0A20833
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbfA3KWU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:22:20 -0500
Received: from mail-qt1-f181.google.com ([209.85.160.181]:46647 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbfA3KWU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:22:20 -0500
Received: by mail-qt1-f181.google.com with SMTP id y20so25527260qtm.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jan 2019 02:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XCMMsmst+3+HktudzZHx/d439ItgKF2SLn79lrde664=;
        b=Yvp3BOfc92Xbdraasr5JhLrMVaHAK5h9b2Qi1Zf0G4A4y/bZqxBBglijrSXFzKYBWo
         BOWRP/7CZIrw3hE1FCB4bCh0/gUn/NW76DLzehphdCRdZCevI6EaL+odcZPCt9YiJ2CQ
         zVjxTP4SduDhqNxIk/0HbRKM74JHnf917UjPxpRq5G14Fw+0cyCE07Thg0fRdHimCKDh
         /Tubag1h47NPQ/0RQNk2X7eAAtAALbyrAXiU/eNQZusw3pxrjjXyTa0cPS2fSsT9IVLu
         K/us/x6w0ww9bIygMrlJk9W/VyOI26rCCPHcniMqOTgJ3w/thBw/arJF9LVhR/kvqATr
         LCjQ==
X-Gm-Message-State: AJcUukeJtpVMSZ3wqCVa9gZwIKbP3mHgnRDSUHxLgW77kvycd005OrmD
        phOPb8qXQdChiZ0jGtbS9pG5p3H+TVTJPMSEmPI=
X-Google-Smtp-Source: ALg8bN7QMTUbGO832hZG9mmunet9FqNU7Cx7YfRlzGneukWZPgk/H1mgjWbtIcWceV1XhUADfXUlpcsUd2l2NY2gfWg=
X-Received: by 2002:a0c:d992:: with SMTP id y18mr28638777qvj.161.1548843739290;
 Wed, 30 Jan 2019 02:22:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548165440.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1548165440.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Jan 2019 11:22:03 +0100
Message-ID: <CAK8P3a2axojR_otZeDqia_f+YTbsWo2X9v+AQWK2YO0wPuA8mg@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v5.0
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 4:12 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these second round of Renesas ARM based SoC fixes for v5.0.
>
> This pull request is based on the previous round of
> such requests, tagged as renesas-fixes-for-v5.0,
> which you have already accepted.

Pulled into arm/fixes, thanks!

    Arnd

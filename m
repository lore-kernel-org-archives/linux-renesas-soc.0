Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C6EC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D339218D2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfAYKkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 05:40:37 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:54450 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfAYKkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 05:40:37 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A78E720057;
        Fri, 25 Jan 2019 11:40:33 +0100 (CET)
Date:   Fri, 25 Jan 2019 11:40:32 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        spice-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/26] drm/irq: Don't check for DRIVER_HAVE_IRQ in
 drm_irq_(un)install
Message-ID: <20190125104032.GA27214@ravnborg.org>
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
 <20190124165831.16427-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124165831.16427-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8
        a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=7gkXJVJtAAAA:8 a=-wFMkYpdgSpu5CXY80EA:9
        a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=AjGcO6oz07-iQ99wixmX:22 a=HkZW87K1Qel5hWWM3VKY:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel.

On Thu, Jan 24, 2019 at 05:58:06PM +0100, Daniel Vetter wrote:
> If a non-legacy driver calls these it's valid to assume there is
> interrupt support. The flag is really only needed for legacy drivers.
> 
> Also remove all the flag usage from non-legacy drivers.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org

The actual code changes looks good.
But if this is the right thing to do I cannot tell.

On this (limited) basis I provide an:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

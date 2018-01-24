Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr40071.outbound.protection.outlook.com ([40.107.4.71]:63040
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933459AbeAXMEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 07:04:16 -0500
Subject: Re: DRM: double free in rcar_du_vsp.c
From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
To: linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org
References: <234140a7-8538-3ec4-1c40-e6ebcc42be8f@epam.com>
Message-ID: <f61c270f-219c-56e5-a03d-e9a3e122d4b4@epam.com>
Date: Wed, 24 Jan 2018 14:04:06 +0200
MIME-Version: 1.0
In-Reply-To: <234140a7-8538-3ec4-1c40-e6ebcc42be8f@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Looping in DRM maintainer.

> Hello,
> 
> I have found issue with double free() in RCAR DU VSP driver. it is
> caused by rcar_du_vsp_plane_atomic_duplicate_state(), which duplicates
> struct rcar_du_vsp_plane_state. This struct holds sg_tables which are
> then freed in rcar_du_vsp_plane_cleanup_fb(). This function is called
> for every rcar_du_vsp_plane_state, so it calls sg_free_table() twice for
> the same sg_table.
> 
> I'm not familiar with DRM, so I can't say why this does not occur every
> time, but this bug caused problems on our setup from time to time. Looks
> like it occurs only under heavy system load.
> 
> As I said, I'm not good in DRM, so I don't know the proper fix. But you
> can find workaround at [1]. I don't know how good it is, but at least
> it resolved issue on our setup. If drm guys think that this fix is fine
> enough, I can push it to the  ML for a proper review.
> 
> [1]
> https://github.com/lorc/linux/commit/80155506d3499273155366a1d263a81baface718 
> 
> 
> Cheers,
> -- 
> Volodymyr Babchuk
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

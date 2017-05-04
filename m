Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33466 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752001AbdEDLVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2017 07:21:23 -0400
Received: by mail-lf0-f49.google.com with SMTP id r17so5964096lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 May 2017 04:21:22 -0700 (PDT)
Subject: Re: [PATCH 1/2] v4l: vsp1: Add support for colorkey alpha blending
To: agheorghe <Alexandru_Gheorghe@mentor.com>,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <1493895213-12573-1-git-send-email-Alexandru_Gheorghe@mentor.com>
 <1493895213-12573-2-git-send-email-Alexandru_Gheorghe@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b4212a5b-da88-16cb-e316-13abef0881cb@cogentembedded.com>
Date: Thu, 4 May 2017 14:21:18 +0300
MIME-Version: 1.0
In-Reply-To: <1493895213-12573-2-git-send-email-Alexandru_Gheorghe@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/04/2017 01:53 PM, agheorghe wrote:

> The vsp2 hw supports changing of the alpha of pixels that match a color
> key, this patch adds support for this feature in order to be used by
> the rcar-du driver.
> The colorkey is interpreted different depending of the pixel format:
> 	* RGB   - all color components have to match.
> 	* YCbCr - only the Y component has to match.
>
> Signed-off-by: agheorghe <Alexandru_Gheorghe@mentor.com>

   Your full name is absolutely necessary here.

MBR, Sergei

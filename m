Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:52351 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751501AbdJ0Spy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Oct 2017 14:45:54 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
In-Reply-To: <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net> <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
Date: Fri, 27 Oct 2017 21:45:17 +0300
Message-ID: <87tvyke8g2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 24 Oct 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.

Please also look into the GCC software, which will detect that your
patch does not compile.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center

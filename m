Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36117 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751221AbdAQT0r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 14:26:47 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <lovelinuxdeeply@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com
Subject: Re: what VSPD Means
Date: Tue, 17 Jan 2017 21:27:03 +0200
Message-ID: <1873427.pWK8928B2P@avalon>
In-Reply-To: <CAAMGra7wFPcm9kBci02hH5SVTud2mx3C4u8A0h7=hnsgdowCJw@mail.gmail.com>
References: <CAAMGra7wFPcm9kBci02hH5SVTud2mx3C4u8A0h7=hnsgdowCJw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Tuesday 17 Jan 2017 21:57:39 Jithin T Raj wrote:
> hi all,
> I am on a small research on VSPD in kernel.. I googled it a lot
> but couldn't get a clear explanation..In my knowledge , it is a memory
> to memory maped video processing engine..It can directly interact to
> DU etc...But I came accross to know that v4l2 in linux supports
> VSPD...is v4l2 a driver?...hopping for your reply

http://www.spinics.net/lists/linux-renesas-soc/msg10384.html

The V4L2 driver is called vsp1.

-- 
Regards,

Laurent Pinchart

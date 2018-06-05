Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36881 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751812AbeFES5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 14:57:50 -0400
Received: by mail-lf0-f67.google.com with SMTP id g21-v6so3236773lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 11:57:50 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980
 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
 <3941727.PNGxG4XCLb@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <df4d4207-5343-36c0-7ca8-d431999a3f31@cogentembedded.com>
Date: Tue, 5 Jun 2018 21:57:47 +0300
MIME-Version: 1.0
In-Reply-To: <3941727.PNGxG4XCLb@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/05/2018 01:09 PM, Laurent Pinchart wrote:

>> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
>> hardware seems the same as in the R-Car V3M (R8A77970).
> 
> How about "the DU hardware has the same topology as in the R-Car V3M 
> (R8A77970)" ? "seems" sounds like we're very unsure :-)

   That's probably better, indeed.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> The patch is against the 'drm-next' branch of David Airlie's 'linux.git'
>> repo.
> 
> Then you might want to switch to git://anongit.freedesktop.org/drm/drm :-)

   No, the corresponding MAINTAINERS records don't include drivers/gpu/drm/rcar-du/
or worse yet, the DU bindings. :-)
  Seriously, I thought you've done a patch to remove your dead 'fbdev' repo months
ago and IO'm still seeing it listed... :-/ 

> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you agree with the small change to the commit message I'll fix the conflict 
> locally, there's no need to resubmit.

   I do agree, except I don't know what conflict you mean.

[...]

MBR, Sergei

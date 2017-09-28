Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33204 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751920AbdI1J13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 05:27:29 -0400
Received: by mail-io0-f194.google.com with SMTP id j26so688994iod.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2017 02:27:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <37669611.vtIjLgZvls@avalon>
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
 <b2179a21-51aa-e973-73de-fd657ecfedb5@ideasonboard.com> <20170928071034.ovxweoxdp3sb3ij2@phenom.ffwll.local>
 <37669611.vtIjLgZvls@avalon>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 28 Sep 2017 11:27:27 +0200
Message-ID: <CAKMK7uFRL_q=fsQfFrnBqyRRpbNt3Csc5vrLkUvm27Bz+QtNMQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: Reject planes located fully off-screen
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 28, 2017 at 11:16 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Daniel,
>
> On Thursday, 28 September 2017 10:10:34 EEST Daniel Vetter wrote:
>> On Wed, Sep 27, 2017 at 07:58:42PM +0100, Kieran Bingham wrote:
>> > Hi Laurent,
>> >
>> > Thankyou for the patch,
>> >
>> > This looks good, and passes the tests.
>> >
>> > On 16/08/17 00:03, Laurent Pinchart wrote:
>> > > There is no point in accepting fully off-screen planes as they won't be
>> > > displayed. Reject them in the atomic check.
>> > >
>> > > Signed-off-by: Laurent Pinchart
>> > > <laurent.pinchart+renesas@ideasonboard.com>
>> >
>> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Just a note, this is different from what i915 does. Not sure you want to
>> intentionally be incompatible with i915 and hence defacto make this part
>> of atomic undefined (or break some apps, depending upon how this pans
>> out). I think X loves to put the cursor offscreen at least.
>>
>> I think we even have igts to test this properly.
>
> If you update the documentation I'll submit a v2 that allows fully off-screen
> planes :-)

Quoting them:

"The destination rectangle can lie outside of the visible area of the
current mode of the CRTC."

This shit is better than I thought!

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#plane-composition-properties

Now can I raise you one and challenge you to run the kms tests in igt
and see how non-compliant your driver is :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

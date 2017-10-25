Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:55798 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751421AbdJYGov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 02:44:51 -0400
Subject: Re: drm/rcar-du: Adjust 14 checks for null pointers
To: Dan Carpenter <dan.carpenter@oracle.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
 <20171025060209.pqtyqk4weduvmzxj@mwanda>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
Date: Wed, 25 Oct 2017 08:44:38 +0200
MIME-Version: 1.0
In-Reply-To: <20171025060209.pqtyqk4weduvmzxj@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>> The script “checkpatch.pl” pointed information out like the following.
>>
>> Comparison to NULL could be written !…
>>
>> Thus fix the affected source code places.
>>
> 
> This one is fine

This kind of feedback is nice.


> except for the commit message.

Would you like to support Unicode characters there?

Regards,
Markus

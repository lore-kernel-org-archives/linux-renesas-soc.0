Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35994 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707AbcEKSzh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 14:55:37 -0400
Received: by mail-lf0-f46.google.com with SMTP id u64so59614863lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 11:55:36 -0700 (PDT)
Received: from localhost (dynamic.0.6.79d1f80.14cc20ac3a53.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id o66sm1483564lfg.32.2016.05.11.11.55.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2016 11:55:34 -0700 (PDT)
Date: Wed, 11 May 2016 20:55:33 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Subject: gen3 rcar-vin prototype
Message-ID: <20160511185533.GE3256@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

I have managed to get the rcar-vin driver which (hopefully) will be 
picked up in the meda_tree, together with code from BSP (ADV7482 and 
CSI2) and local hacks to all parts above to work on Gen3.

The prototype only works for composit input and there is a lot of hard 
coded stuff in there. But you can run qv4l2 or other such tool and view 
the stream without problem. Obviously there is still a lot of work to do 
here. But the code can be found at:

https://git.ragnatech.se/linux rcar-vin-gen3-prorotype-1

-- 
Regards,
Niklas S�derlund

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60385 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752743AbeDXI6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 04:58:39 -0400
Date: Tue, 24 Apr 2018 10:58:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Hien Dang <hien.dang.eb@renesas.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/2] thermal: rcar_gen3_thermal: Update calculation
 formula due to HW evaluation
Message-ID: <20180424085835.4djdbpa7gv4szx2m@verge.net.au>
References: <20180417205747.15492-1-niklas.soderlund@ragnatech.se>
 <20180417205747.15492-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180417205747.15492-2-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 17, 2018 at 10:57:46PM +0200, Niklas Söderlund wrote:
> From: Hien Dang <hien.dang.eb@renesas.com>
> 
> Due to hardware evaluation result,
> Max temperature is changed from 96 to 116 degree Celsius.
> Also, calculation formula and pseudo FUSE values are changed accordingly.
> 
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

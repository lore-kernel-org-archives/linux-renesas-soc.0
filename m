Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 30 Aug 2016 16:02:16 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Grant Likely <grant.likely@secretlab.ca>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: devicetree: changesets do locking on
 their own meanwhile
Message-ID: <20160830210216.GA19645@rob-hp-laptop>
References: <20160824133900.7282-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160824133900.7282-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 24, 2016 at 03:38:56PM +0200, Wolfram Sang wrote:
> Since commit 183223770ae862 ("drivers/of: Export OF changeset functions"),
> the mentioned functions do all necessary locking.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: 183223770ae862 ("drivers/of: Export OF changeset functions")
> ---
> 
> V2: corrected the "Fixes" tag
> 
>  Documentation/devicetree/changesets.txt | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Applied, thanks.

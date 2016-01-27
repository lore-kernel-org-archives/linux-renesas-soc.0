Return-Path: <SRS0+1xJ5=N3=lists.infradead.org=linux-arm-kernel-bounces+horms=verge.net.au@vergenet.net>
Date: Wed, 27 Jan 2016 20:24:03 +0900
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 00/14] r8a7793, gose: Add audio support to device tree
Message-ID: <20160127112403.GB26357@verge.net.au>
References: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1453094889-25204-1-git-send-email-horms+renesas@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+horms=verge.net.au@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 18, 2016 at 02:27:55PM +0900, Simon Horman wrote:
> Hi,
> 
> this series adds support to r8a7793 and gose device trees for
> rcar sound: first in PIO mode then using DMA
> 
> I have been unable to test if audio works (in PIO mode) as I
> do not have physical access to a gose board. I would appreciate
> some assistance there.

I have been able to perform some basic testing and have queued up this
series.

> This work is based heavily on the work of others for the r8a7791 and
> koelsch as noted in the changelogs of individual patches.
> 
> This series is based on renesas-devel-20160111-v4.4 and
> has no other dependencies that I am aware of.

[snip]

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
